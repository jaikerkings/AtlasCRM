Ext.require(['Ext.tree.*','Ext.data.*','Ext.tip.*']);
var opcElegidaMenu = "prueba";
/*
Ext.Viewport.element.dom.addEventListener('click', function (e) {
	    if (e.target.tagName !== 'A') {
	        return;
	    };
	    e.preventDefault();
	    var href = e.target.getAttribute('href');
	    console.log("hola: "+href);
	}, false);
*/
function cargarOpcion() {
	console.log("cargando..."+opcElegidaMenu);
	$(document).load(opcElegidaMenu);
	/*Ext.Ajax.request({
	    url: opcElegidaMenu,
	    success: function(response){
	    	console.log(response);
	        //Ext.getCmp('mainViewport').update( response.responseText );
	    }
	});*/
}

var treeStore = Ext.create('Ext.data.TreeStore', {
					//root: {expanded: true, text: "", "data": []}, // <- Inline root
	         		proxy: {
	         			type: 'ajax',
	         			url: 'opcionMenus/obtenerMenuOpcionesPorRol?idRol='+rolUsuarioActual //variable global definida en el index.html.erb
	         		},
	         		root: {
	         			text: 'Menu',
	         			id: 'root_node',
	         			expanded: true
	         		},
	         		folderSort: false,
	         		sorters: [{
	         			property: 'id',
	         			direction: 'ASC'
	         		}]
	         	});


Ext.define('treeMenu', {
		extend:'Ext.tree.Panel',
		alias: 'widget.treeMenu',
     	id : 'arbolMenu',
     	emptyText:'No hay opciones...',
     	store: treeStore,
     	region:'west',
     	collapsible:true,
     	width: 220,
        minSize: 100,
        maxSize: 220,
        rootVisible: false,
	    //renderTo: 'westPanel',
	    bodyStyle: '',
	    title: 'Menú de Opciones',
	    useArrows: true,
	    listeners : {
            itemclick : function(view,rec,item,index,eventObj) {
			    // You can access your node information using the record object
			    // For example: record.get('id') or record.get('some-param')
			    console.log(item.id+"el");
			    opcElegidaMenu = rec.get('href');
			    console.log(opcElegidaMenu);
			    console.log(rec.get('ruta'));
			    if(rec.get('id')=='SP') {
			        // I do my necessary logic here.. may be open a perticular window, grid etc..
			    }

			    if(rec.get('id')=='CO') {
			        // I do my necessary logic here.. may be open a perticular window, grid etc..
			    }           
			    //return false;
			},
			click : function(view,rec,item,index,eventObj) {
			    // You can access your node information using the record object
			    // For example: record.get('id') or record.get('some-param')
			    console.log(item.id+"aaaaaaa");
			    
			}
		}
});

Ext.onReady(function() {
	//var arbol = Ext.create('treeMenu');

	Ext.create('Ext.container.Viewport', {
	    layout: 'border',
	    id:'mainViewport',
	    items: [{
	        region: 'north',
	        html: '<h1 class="x-panel-header">Page Title</h1>',
	        autoHeight: true,
	        border: false,
	        margins: '0 0 5 0'
	    }, Ext.create('treeMenu'),
	    {
	        region: 'center',
	        xtype: 'tabpanel', // TabPanel itself has no title
	        activeTab: 0,      // First tab active by default
	        items: {
	            title: 'Default Tab',
	            html: 'The first tab\'s content. Others may be added dynamically'
	        }
	    }/*{
	        region: 'west',
	        collapsible: true,
	        title: 'Navigation',
	        width: 150,
	        // could use a TreePanel or AccordionLayout for navigational items
	        items:[ Ext.create('treeMenu')]
	    }, {
	        region: 'south',
	        title: 'South Panel',
	        collapsible: true,
	        html: 'Information goes here',
	        split: true,
	        height: 100,
	        minHeight: 100
	    }, {
	        region: 'east',
	        title: 'East Panel',
	        collapsible: true,
	        split: true,
	        width: 150
	    }*/]
	});
});