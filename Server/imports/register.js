var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var sql = require("mssql/msnodesqlv8"); 



var urlencodedParser = bodyParser.urlencoded({ extended: false })
var dbConfig=require('./dbConfig');



module.exports = function(app){



   app.post('/process_register', urlencodedParser, function (req, res) {  
     res.header("Access-Control-Allow-Origin","*");
     var email_reg=req.body.email_reg;
     var name_reg=req.body.name_reg;
	 var surname_reg=req.body.surname_reg;
     var pwd_req=req.body.pwd_req;
	 var pwd_req_repeat=req.body.pwd_req_repeat;
     console.log("Web servis register işlemi -->",email_reg);
	 
	sql.close();   
   sql.connect(dbConfig, function(err){
        if(err){
            console.log(err);
        }
        else {                       
            var request = new sql.Request();          
            request.query("INSERT INTO UsersTable (Name,Surname,Email,Password) VALUES ('"+name_reg+"','"+surname_reg+"','"+email_reg+"','"+pwd_req+"');SELECT TOP (1) UserID FROM UsersTable order by UserID desc ",		
			
			function(err, data){
				
                var result="";
				if(err)
				{
                    result='{ "success":false,"userid":"0"}';						
					console.log("Kayit yapılamadı -->",JSON.stringify(err));
										
                }
                else
				{
					var userid=JSON.parse(JSON.stringify(data.recordsets[0][0])).UserID;
					//console.log(userid);
					result='{ "success":true,"userid":"'+userid+'"}';						
					console.log("Kayit yapıldı -->",email_reg+" "+name_reg+" "+surname_reg);
				
                }
			    res.end(result);
				console.log("**********************************************\n");
                sql.close();    
            });        		
        }
    });
   
   
   
   
   
   
})
}