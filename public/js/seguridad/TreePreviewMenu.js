Ext.require(['Ext.tree.*','Ext.data.*','Ext.tip.*']);

var treeStore = Ext.create('Ext.data.TreeStore', {
					root: {expanded: true, text: "", "data": []}, // <- Inline root
	         		proxy: {
	         			type: 'ajax',
	         			url: 'app/controller/rol_controller.php?operacion=obtenerOpcionesDeMenuPorRol&idRol=-1'
	         		},/*
	         		root: {
	         			text: 'Menu',
	         			id: 'root_node',
	         			expanded: true
	         		},*/
	         		folderSort: false,
	         		sorters: [{
	         			property: 'id',
	         			direction: 'ASC'
	         		}]
	         	});


Ext.define('treePreviewMenu', {
		extend:'Ext.tree.Panel',
		alias: 'widget.treePreviewMenu',
     	id : 'arbolPreviewMenu',
     	emptyText:'No hay registros...',
     	store: treeStore,
     	region:'west',
     	collapsible:true,
     	width: 220,
        minSize: 100,
        maxSize: 220,
        rootVisible: false,
	    //renderTo: 'westPanel',
	    bodyStyle: '',
	    title: 'Menú de Opciones(Preview)',
	    useArrows: true,
});

/*var tree = Ext.create('Ext.tree.Panel', {
	         		store: store,
	         		renderTo: 'tree_el',
	         		height: 246,
	         		width: 250,
	         		title: 'Opciones',
	         		useArrows: true,
	                         
	         	});*/
