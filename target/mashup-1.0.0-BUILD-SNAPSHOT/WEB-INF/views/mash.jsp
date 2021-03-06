<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Simple mashup example</title>
    <script src="https://spotfire-next.cloud.tibco.com/spotfire/js-api/loader.js"></script>
</head>
<body>
    <div id="container"></div>
</body>
<script>
    var app;
    var doc;
    var webPlayerServerRootUrl = "http://localhost:82/spotfire/wp/";
    var analysisPath = "/abc/병원처방_barchar";
    var parameters = '';
    var reloadInstances = true;
    var apiVersion = "7.14";
    var customizationInfo;
 
    spotfire.webPlayer.createApplication(
        webPlayerServerRootUrl,
        customizationInfo,
        analysisPath,
        parameters,
        reloadInstances,
        apiVersion,
        onReadyCallback,
        onCreateLoginElement 
        );
 
    function onReadyCallback(response, newApp)
    {
        app = newApp;
        if(response.status === "OK")
        {
            // The application is ready, meaning that the api is loaded and that 
            // the analysis path is validated for the current session 
            // (anonymous or logged in user)
            console.log("OK received. Opening document to page 0 in element renderAnalysis")
            doc = app.openDocument("container", 0);
        }
        else
        {
            console.log("Status not OK. " + response.status + ": " + response.message)
        }
    }
 
    function onError(error)
    {
        console.log("Error: " + error);
    }
 
    function onCreateLoginElement()
    {
        console.log("Creating the login element");

        // Optionally create and return a div to host the login button
        return null;
    }
</script>
</html>