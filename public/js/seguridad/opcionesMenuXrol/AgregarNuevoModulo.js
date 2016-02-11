/**
 * The FieldContainer\'s child items are arranged like in any other container, using the
 * layout configuration property. In this example, each FieldContainer is set to use an
 * HBox layout.
 *
 * FieldContainers can be configured with the combineErrors option, which combines errors
 * from the sub fields and presents them at the container level. In this example the
 * Availability, Phone and Full Name items have this option enabled, and the Time worked
 * item does not.
 */
Ext.define('FrmAgregarNuevoModulo', {
    extend: 'Ext.form.Panel',
    xtype: 'form-fieldcontainer',
    //controller: 'form-fieldcontainer',
    width: 600,
    bodyPadding: 10,
    defaults: {
        anchor: '100%',
        labelWidth: 100
    },
    items: [{
        xtype: 'textfield',
        name: 'txtTextoParaMostrar',
        id: 'txtTextoParaMostrar',
        fieldLabel: 'Nombre de la nueva opción(tal como se mostrará en el menú)',
        labelAlign: 'top',
        emptyText:'ejemplo: Incluir P&oacute;liza.(los carácteres especiales van en notacion HTML (&aecute ;))',
        //vtype: 'text',
        msgTarget: 'side',
        allowBlank: false
    },{
        xtype: 'textfield',
        name: 'txtLinkDeAcceso',
        id: 'txtLinkDeAcceso',
        fieldLabel: 'Ruta de acceso (lo que irá en el href)',
        labelAlign: 'top',
        emptyText:'ejemplo: app/view/prestamos/seguros/incluirPoliza.php',
        //vtype: 'text',
        msgTarget: 'side',
        allowBlank: false,
        listeners: {
            focus: function(){
                this.setValue('app/view/prestamos/seguros/nombreArchivo.php');
                this.selectText();
            },
            blur: function(){
                //this.setValue('');
            }
        }
    },{
        xtype: 'combobox',
        name: 'cmbOpcionPadre',
        id: 'cmbOpcionPadre',
        flex:1,
        editable:false,
        forceSelection: true,
        fieldLabel: 'Menú principal al que pertenece',
        labelAlign: 'top',
        emptyText:'Seleccionar...',
        //value: 'Ninguno, (ésta es una opción padre del menú.)',
        valueField: 'idOpcion', //nombre del campo devuelto por la consulta que servira de value en el combo
        displayField: 'Modulo', //nombre del campo devuelto por la consulta que servira de texto en el combo
        store: {
            type: 'remote-modulosPadre'
        },
        // We're forcing the query to run every time by setting minChars to 0
        // (default is 4)
        minChars: 0,
        queryParam: 'q',
        queryMode: 'remote',
        selecOnFocus: true,
        listeners: {
            select: function(combo, record, index) {
                //rolSeleccionado = combo; //variable global
                console.log(Ext.getCmp("cmbOpcionPadre").getValue());
                console.log(Ext.getCmp("cmbOpcionPadre").getRawValue());
                //console.log(combo);
                //Ext.getCmp('permisosGrid').getStore().load({params: {idRol: rolSeleccionado.getValue()}, callback: function(records, operation, success) {/*do something after the load finishes*/}, scope: this });
                //Ext.getCmp('arbolPreviewMenu').getStore().load({scope: this, params:{idRol: rolSeleccionado.getValue()}});
            }
        }
    }],
    buttons: [{
            text     : 'Aceptar',
            formBind: true, // Disponible hasta que los campos esten validados
            disabled: true,
            handler: function() {
                var valorCmbOpcionPadre = Ext.getCmp("cmbOpcionPadre").getValue();
                if (valorCmbOpcionPadre != null){
                    var storeModulosGrid = Ext.getCmp('modulosGrid').getStore();
                    //console.log(Ext.getCmp("cmdOpcionPadre").getValue());    
                    var nombreModulo = storeModulosGrid.findRecord('Modulo', Ext.getCmp("txtTextoParaMostrar").getValue());
                    
                    var rutaModulo = Ext.getCmp("txtLinkDeAcceso").getValue();
                    
                    if (valorCmbOpcionPadre == 0){
                        rutaModulo = "";   
                    }
                    
                    //console.log('nombre: '+ nombreModulo);
                    //console.log('ruta: '+ rutaModulo);
                    
                    if ((nombreModulo == null)){// si no estan ya en la tabla 
                        var newModulo = new ModulosModel({idOpcion: -1, Modulo: Ext.getCmp("txtTextoParaMostrar").getValue(), LinkDeAcceso: rutaModulo, OpcionPadre: Ext.getCmp("cmbOpcionPadre").getRawValue(), idOpcionPadre: valorCmbOpcionPadre, ACTUALIZADO_POR: sessvars.sesion.codigo+'/'+sessvars.sesion.cedula});
                        console.log(newModulo);
                        storeModulosGrid.insert(storeModulosGrid.getCount(),newModulo);
                        //storeModulosGrid.insert(0,new ModulosModel());    
                        
                        storeModulosGrid.load();
                        Ext.getCmp("winAgregarNuevoModulo").close();
                        moduloSeleccionado = null;
                        Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                    }else{
                        Ext.MessageBox.alert('Error', 'Disculpe, éste módulo ya se encuentra registrado, verifique e intente de nuevo.');
                        //Ext.getCmp("txtLinkDeAcceso").setValue('');
                        //Ext.getCmp("txtTextoParaMostrar").setValue('');
                        Ext.getCmp("winAgregarNuevoModulo").close();
                        moduloSeleccionado = null;
                        Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
                    }
                }else{
                    Ext.MessageBox.alert('Error', 'Disculpe, primero debe seleccionar una opción.');
                    Ext.getCmp("cmdOpcionPadre").focus();
                }
            }
        },{
            text     : 'Cancelar',
            handler  : function(){
                Ext.getCmp("winAgregarNuevoModulo").hide();
                moduloSeleccionado = null;
                Ext.getCmp('modulosGrid').getSelectionModel().deselectAll();
            }
        }]
});