/**
 * 
 */

	const formulario = document.getElementById("fromCliente");
	
	formulario.addEventListener("submit",function(event){
		const fromData = new FromData(formulario);
		const datosFormulario ={};
		for (const [key,value] of fromData){
			datosFormulario[key]=value;
		}
		console.log("Datos del formulario (fromData): ", datosFormulario);
		const nombre =document.getElementById();
		const email =document.getElementById();
		alert("Bienvenido a nuestro sitio web "+nombre+" "+email);
	});