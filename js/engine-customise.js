(function(){
    var properties = [
        {
            'name': 'text',
            'type': 'color'
        },
        {
            'name': 'font-size',
            'type': 'integer'
        },
        {
            'name': 'primary',
            'type': 'color'
        },
        {
            'name': 'button-text',
            'type': 'color'
        },
        {
            'name': 'button-bg',
            'type': 'color'
        },
        {
            'name': 'scene-text',
            'type': 'color'
        },
        {
            'name': 'scene',
            'type': 'string'
        },
        {
            'name': 'form-header',
            'type': 'boolean'
        },
        {
            'name': 'form-bg',
            'type': 'color'
        },
        {
            'name': 'form-hollow',
            'type': 'boolean'
        },
        {
            'name': 'form-text',
            'type': 'color'
        },
        {
            'name': 'form-padding',
            'type': 'integer'
        },
        {
            'name': 'icon-bg',
            'type': 'color'
        },
        {
            'name': 'icon-fill',
            'type': 'color'
        },
        {
            'name': 'panel-head-bg',
            'type': 'color'
        },
        {
            'name': 'panel-body-bg',
            'type': 'color'
        },
        {
            'name': 'panel-text',
            'type': 'color'
        },
        {
            'name': 'radius',
            'type': 'integer'
        },
        {
            'name': 'button-radius',
            'type': 'integer'
        },
        {
            'name': 'full-width',
            'type': 'boolean'
        },
        {
            'name': 'hide-modules',
            'type': 'list'
        },
        {
            'name': 'hide-return',
            'type': 'boolean'
        },
        {
            'name': 'images-import',
            'type': 'string'
        },
        {
            'name': 'css-import',
            'type': 'external'
        }
    ];

    less.modifyVars(getURLProperties(properties));

    function grab(string, from) {
        var exp = '[\\?&]' + string + '=([^&#]*)',
            regex = new RegExp(exp),
            results = regex.exec(from);
        if (results === null) {
            return false;
        } else {
            return results[1];
        }
    }

    function getURLProperties(properties){
        var len = properties.length,
            url = window.location.href,
            obj = {};
        for(var i=0; i<len; i++){
            var property = properties[i].name,
                val = grab(property, url);
            if (val){
                switch(properties[i].type){
                    case 'string':
                        if (val !== "false") {
                            val = '\"' + val + '\"';
                        }
                        obj[property] = val;
                        break;
                    case 'color':
                        if(/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i.test('#' + val)) {
                            val = '#' + val;
                            obj[property] = val;
                        }
                        break;
                    case 'external':
                        loadExtCSS(val);
                        break;
                    case 'boolean':
                        if(val == 'true' || val == 'false') {
                            obj[property] = val;
                        }
                        break;
                    case 'list':
                        val = (val === 'all') ? ['header', 'cars', 'suppliers', 'icon', 'destinations', 'powered'] : val.split('+');
                        for(l=0; l < val.length; l++) {
                            val[l] = "\"" + val[l] + "\"";
                        }
                        obj[property] = val;
                        break;
                    default :
                        obj[property] = val;
                        break;
                }
            }
        }
        return obj;
    }

    function loadExtCSS(argFiles){
        var files = argFiles.split('+'),
            head = document.getElementsByTagName("head")[0];
        for(var i = 0; i < files.length; i++) {
            var file = document.createElement("link");
            file.setAttribute("rel", "stylesheet");
            file.setAttribute("type", "text/css");
            file.setAttribute("href", '/affiliateXmlStylesheets/' + files[i] + '/css/import.css');
            head.appendChild(file);
        }
    }
})();