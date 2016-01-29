/**
 * Ext.ux.ValidarEntero
 *
 * @author    : Edgar Gonzalez
 * @date      : 16 de marzo del 2013
 * @email     : egonzale@ucla.edu.ve
 */

Ext.apply(Ext.form.VTypes, {
 validInteger: function(value, field)
 {
  var lon = value.length-1;
  var x=value.substr(lon,1);
  if(/[^0-90-9]/.test(x)) return false;
  return true;
 },
 validIntegerText: 'Debe ser un numero entero'
});