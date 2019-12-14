var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var sql = require("mssql/msnodesqlv8"); 



var urlencodedParser = bodyParser.urlencoded({ extended: false })
var dbConfig=require('./dbConfig');



module.exports = function(app){
myResult="";
app.post('/process_saveImageUrl', urlencodedParser, function (req, res) { 
	res.header("Access-Control-Allow-Origin","*");
    console.log("Url kayıt isteği geldi : ");
	var ImageUrl=req.body.NewName;
	var AuthorID=req.body.AuthorID;
	var PlaceID=req.body.PlaceID;
		 
	
	
   sql.close();
   sql.connect(dbConfig).then(() => {
    return sql.query("INSERT INTO ImagesTable (ImageUrl,AuthorID,PlaceID) VALUES ('"+ImageUrl+"',"+AuthorID+",'"+PlaceID+"')")
	}).then(result => {
		
		myResult=(JSON.stringify(result.recordsets[0]));	
		console.log(authorid +" için sayfa ziyareti işlendi, toplam ziyaret :"+myResult);
		res.end(myResult);
	}).catch(err => {
		console.log("hata1"+err);
	})
	 
	sql.on('error', err => {
		console.log("hata2");
		
})
  
  

	  
})


   

}