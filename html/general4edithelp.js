function gCampaignFromRequest(parameterString) {
    var campaignDataStart = parameterString.indexOf("c=") + 2;
    if (campaignDataStart >= 3) {
        var ampIndex = parameterString.indexOf("&",campaignDataStart);
        var campaignDataEnd = ampIndex >= 0 ? ampIndex
            : parameterString.length;
        if (campaignDataEnd > campaignDataStart) {
            var campaignString = parameterString.substring(campaignDataStart,
                                                           campaignDataEnd);
            return campaignString.split(",").map(function(s) {
                var n = parseInt(s.substring(0, 3));
                if (n >= -128 && n <= 127) {
                    return n;
                } else {
                    console.log("bad number in campaign data: " + s);
                    return 0;
                }
            });
        }
    }
}

