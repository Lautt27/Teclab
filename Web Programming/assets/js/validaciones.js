$ ("#form_categorias").submit(function() {
    var nombre = $("#categorias").val();
    
    if($.trim(nombre)===''){
        alert("Debe completar la categoría \n Lautaro");
        return false
    }
    return true
})

$ ("#form_productos").submit(function() {
    var producto = $("#nombre").val();
    var descripcion = $("#descripcion").val();
    var precio = $("#precio").val();
    var categoria = $("#categoria").val();
    
    var errores = [];
    
    if($.trim(producto)===''){
        errores.push("Debe ingresar el producto");
    
    if($.trim(descripcion)==='')
        errores.push("Debe ingresar una descripcion");
    
    if($.trim(precio)==='')
        errores.push("Debe ingresar el precio");
    
    if($.trim(categoria)==='')
        errores.push("Debe ingresar una categoría");
    
    if (errores.length >0)
        errores.push("Lautaro");
        alert(errores.join("\n"));
        return false;
    }
    return true
})