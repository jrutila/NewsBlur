var baseUrl = "https://www.newsblur.com/";

function loadJson(url, loaded, data) {
    var xhr = new XMLHttpRequest();
    var type = "GET";
    var params = data;
    if (data != null)
    {
        type = "POST";
    }
    xhr.open(type,baseUrl+url,true);
    if (data != null)
    {
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.setRequestHeader("Content-length", params.length);
        xhr.setRequestHeader("Connection", "close");
    }
    xhr.onreadystatechange = function()
    {
        if ( xhr.readyState == xhr.DONE)
        {
            if ( xhr.status == 200)
            {
                var jsonObject = eval('(' + xhr.responseText + ')');
                loaded(jsonObject)
            }
        }
    }
    xhr.send(params);
}

function login(username, success) {
    loadJson("api/login/", success, "username="+username);
}

function getFeeds(success) {
    loadJson("reader/feeds", success);
}
