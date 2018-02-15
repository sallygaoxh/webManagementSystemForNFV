var box = new twaver.ElementBox();
var network = new twaver.vector.Network(box);
function initNetwork() {
    var view = network.getView();
    
    document.getElementById('topo').appendChild(view);
    network.adjustBounds({x: 0, y: 0, width: 1300, height: 600});
    
    network.getToolTip = function (element) {
        
        if(element instanceof twaver.Node){
            var name = element.getName();
            var name2 = element.getName2();
            var clientProperty = element.getClient('vlan');
            return 'name:' + name + '<br>' + 'brand:' + element.getClient('brand') +'<br>'
            + 'vlan:' + element.getClient('vlan');
        }
        else if(element instanceof twaver.Link){
            var name = element.getName();
            var client = element.getClient('clientProperty');
            return 'name:' + name + '<br>' + 'client:' + client;
        }
        
    }
    twaver.Styles.setStyle('label.color','#ec6c00');
    twaver.Styles.setStyle('label2.color','#57ab9a');
    twaver.Styles.setStyle('select.color','#ef8200');
}
function registerImage() {
    registerNormalImage('../static/img/router.png','router');
    registerNormalImage('../static/img/switch1.png','switch1');
}

function registerNormalImage(url, name) {
    var image = new Image();
    image.src = url;
    image.onload = function() {
        twaver.Util.registerImage(name, image, 32, 32);
        image.onload = null;
        network.invalidateElementUIs();
    }; }
    

function init() {
    registerImage();
    initNetwork();
//    initDataBox();
}
function setColor(element){
    if(element instanceof twaver.Node){
        if(element.getClient('vlan')=='vlan1'){
            return '#BFBFBF';
        }else if(element.getClient('vlan')=='vlan2'){
            return '#66ff99';
        }else if(element.getClient('vlan')=='vlan3'){
            return '#AB82FF';
        }else{
            return '#ff3399';
        }
    }
}