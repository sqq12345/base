$(function() {

    var clipboard = new ClipboardJS(".content_copy", {
        text: function (e) {
            var url = gethost()+e.attributes.data_href.nodeValue;
            console.log(e);
            return url;
        }
    });
    clipboard.on('success', function (e) {
        layer.msg("复制成功",{ time:1000,icon:1});
    });

    clipboard.on('error', function (e) {
        console.log(e);
    });

})

function gethost(){
    return window.location.protocol+"//"+window.location.host;
}