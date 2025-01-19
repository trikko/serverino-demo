module app;

import std;

import serverino;
import qr;

mixin ServerinoMain;

// These files are compiled into the binary as const strings
auto homepage = import("homepage.html");
auto css = import("main.css");

// This function is called for each request
// It is a simple website so we handle everything in this function
void serve(Request request, Output output)
{
	// Only handle GET requests
	if (request.method != Request.Method.Get)
		return;

	switch (request.path)
	{
		// Serve the homepage
		case "/":
			output ~= homepage;
			break;

		// Serve the css file
		case "/styles/main.css":
			output.addHeader("Content-Type", "text/css");
			output ~= css;
			break;

		// Serve the qr code
		case "/qr":
			// Read data parameter from GET request, default to "Hello, World!"
			auto data = request.get.read("data", "Hello, World!");

			// Serve the qr code
			output ~= cast(char[]) QrCode(data).toBytes(format: OutputFormat.PNG);
			output.addHeader("Content-Type", "image/png");
			break;

		// Everything else is not handled (will return 404)
		default: return;
	}

	// Add cache for 1 hour for all requests
	//output.addHeader("Cache-Control", "max-age=3600");
}


@onServerInit ServerinoConfig configure()
{
	return ServerinoConfig
		.create()
		.addListener("0.0.0.0", 8080)
		.setMaxRequestTime(1.seconds)
		.setMaxWorkers(20)
		.setMinWorkers(2)
		.setMaxRequestSize(100*1024);

}

