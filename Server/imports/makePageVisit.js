var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var sql = require("mssql/msnodesqlv8"); 



var urlencodedParser = bodyParser.urlencoded({ extended: false })
var dbConfig=require('./dbConfig');



module.exports = function(app){
myResult="";
app.post('/process_pageVisit', urlencodedParser, function (req, res) { 
	res.header("Access-Control-Allow-Origin","*");
    console.log("Sayfa ziyareti isteği geldi : ");
	
	var placeid=req.body.PlaceID;
	var authorid=req.body.AuthorID;
	
   sql.close();
   sql.connect(dbConfig).then(() => {
    return sql.query("PageVisit "+authorid+","+placeid+" ")
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