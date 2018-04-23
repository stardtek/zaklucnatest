
var express = require('express');
var app = express();
let path = require('path');
const async = require('async');
var session = require('express-session');
var cookieParser = require('cookie-parser');

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug'); 

var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use(cookieParser());  

app.use(session({secret: 'kojikurac', 
                resave: true,
                saveUninitialized: true,
                cookie: { ime: "asddddsda" }}));

var sess;

function seson(s){
  sess = s;
}

app.set('trust proxy', 1);

app.use(express.static('public'));

var mysql = require('mysql');
var pool = mysql.createPool({
  host     : '127.0.0.1',
  user     : 'root',
  password : 'usbw',
  database : 'baza'
});

var PythonShell = require('python-shell');

/*
app.get('/', function (req, res) {
    res.render('test');
  });
*/

app.get('/', function (req, res) {
  res.sendfile('login.html');
});
app.get('/login', function (req, res) {
  
  res.sendfile('register.html');
});

//  app.post('/index.html', function (req, res) {
//    res.sendfile('index.html');
//  });

app.post('/register.html', function (req, res){

  
  
  const con = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: "usbw",
      database: "baza"
      });

      con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
      //console.log(document.getElementById("username").value);
      const podatki = req.body;

      con.query('SELECT * FROM uporabniki where username = "' + podatki.username + '"', function (err, result1) {
        if (err) throw err;
            if(result1.length > 0){
              
              res.redirect('/');
            }else{

              var sql = "INSERT INTO uporabniki (username, password) VALUES ('"+podatki.username+"',"+ "'"+podatki.password+"')";
                console.log(sql);
                con.query(sql, function (err, result) {
                    if (err) throw err;
                console.log("1 record inserted");
                res.sendfile('login.html');
            });

            }
        });

      

  });

  
});



app.post('/upisan.html', function (req, res){

  sess = req.session;
  sess.ime = req.body.username;
  seson(sess);
  console.log(sess);


  
  const con = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: "usbw",
      database: "baza"
      });

      con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
      //console.log(document.getElementById("username").value);
      const podatki = req.body;
      //console.log(podatki);
      var sql = "SELECT * FROM `uporabniki`";
      //console.log(sql);
      con.query(sql, function (err, result) {
          if (err) throw err;
          //console.log(JSON.stringify(result));
          //console.log(result);
         
          //console.log(result[0].username);
      var load = 0;
      for(i=0;i<result.length;i++){
          var ime = result[i].username;
          var pass = result[i].password;
      if(ime==podatki.username && pass==podatki.password){

          if(podatki.username == 'admin'){
            res.sendfile('./izberiAdmin.html');
          }else{
            res.sendfile('./izberiUporabnik.html');

          }

          load=1;
          break;
      }
      else{
          console.log("napacno geslo ali ime");
          
          
      

      }
  }
  if(load==0){
      res.sendfile('login.html');
  }

  });
 
  });

 
  
});

app.get('/adminNaloge', function(req, res){
    res.sendfile('./public/adminNaloge.html');
    
});

app.get('/getNaloge', function(req, res){

  pool.getConnection(function(err, connection) {
    // Use the connection
    connection.query('SELECT * FROM naloge', function (error, results, fields) {

      console.log(results);
      res.send(results);
      // And done with the connection.
      connection.release();
   
      // Handle error after the release.
      if (error) throw error;
   
      // Don't use the connection here, it has been returned to the pool.
    });
  });

    /*
    connection.connect();
 
    connection.query('SELECT * FROM naloge', function (error, results, fields) {
        if (error) throw error;
        console.log(results);
        res.send(results);
    });
    
    connection.end();
    */
});

app.get('/novTest', function(req, res){
    res.sendfile('./public/novTest.html');
    
});

app.get('/nalogeTest', function(req, res){

  let Naloge = [];

  pool.getConnection(function(err, connection) {
    if (err){
      console.log("error", err.message)
       throw err;
     }
    // Use the connection
    connection.query('SELECT * FROM naloge', function (error, results, fields) {
      if (error) throw error;

      

      var randSt = [];
      while(randSt.length < 8){
          var randomnumber = Math.round(Math.random()* results.length) - 1;
          if(randSt.indexOf(randomnumber) > -1) continue;
          randSt[randSt.length] = randomnumber;
      }

      res.send([results[randSt[0]], results[randSt[1]], results[randSt[2]], results[randSt[3]]]);
      
      //console.log(results[randSt1]);
      //console.log(results[randSt2]);
      //console.log(results);
      //res.send([results[randSt1], results[randSt2]]);
      // And done with the connection.
      connection.release();
  
      // Handle error after the release.
     
      // Don't use the connection here, it has been returned to the pool.
    });
    
  });

  


  
  
  

  //console.log(Naloge);
  //res.send(Naloge);

});




var fs = require('fs');

app.post('/python', function(req, res){
  fs.writeFile("my_script.py", req.body.data, function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
  }); 

  PythonShell.run('my_script.py', function (err, results) {
    if (err){
      console.log('--------------' + err.traceback);
      res.send({data: [err.traceback]});
    }else{
      // results is an array consisting of messages collected during execution
      console.log('results: %j', results);
      res.send({data: results});
    }
  });




  /*
    let koda = req.body.data.substring(0, req.body.data.lastIndexOf('\n'));
    let klic = req.body.data.substring(req.body.data.lastIndexOf('\n')+1);
  
  python.ex`
    def atomic():
      hello = 123
      return 1
  `;
  python`atomic()`.then(x => res.send({data: x}));

  */
  
  });

  app.post('/shraniTest', function(req, res){
    var navodila1 = req.body.nal1;
    var navodila2 = req.body.nal2;
    var navodila3 = req.body.nal3;
    var navodila4 = req.body.nal4;
    var koda1 = req.body.koda1;
    var koda2 = req.body.koda2;
    var koda3 = req.body.koda3;
    var koda4 = req.body.koda4;

    const con = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: "usbw",
      database: "baza"
      });

      con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
      //console.log(document.getElementById("username").value);
      const podatki = req.body;
      //console.log(podatki);
      var sql = "INSERT INTO `testi1`(`user`, `navodila1`, `koda1`, `navodila2`, `koda2`, `navodila3`, `koda3`, `navodila4`, `koda4`) VALUES ('" + sess.ime + "', '" + navodila1 + "', '" + koda1 + "', '" + navodila2 + "', '" + koda2 + "', '" + navodila3 + "', '" + koda3 + "', '" + navodila4 + "', '" + koda4 + "')";
      console.log(sql);
      con.query(sql, function (err, result) {
          if (err) throw err;
      console.log("1 record inserted");
  });
 // window.location.href= 'htttp://127.0.0.1:3000/index.html';

  });
  });


  app.post('/oceniTest', function(req, res){
    const con = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: "usbw",
      database: "baza"
      });

      var podatki = req.body;
      var seznamID = [podatki.nal1, podatki.nal2, podatki.nal3, podatki.nal4];
      var seznamKoda = [podatki.koda1, podatki.koda2, podatki.koda3, podatki.koda4];

      var dosezeneTocke = [0,0,0,0];

      console.log(podatki);
      console.log('--------');
      console.log(seznamID);
      console.log('---------------');
      console.log(seznamKoda);
      console.log('-----------');

      async.forEachOfSeries([0,1,2,3], function(value1, key1, callback1){


        con.query('SELECT * from resitve WHERE idNaloge=' + seznamID[value1], function (error, result) {
          console.log(result);
          seznam1 = [result[0].vnos1, result[0].vnos2, result[0].vnos3, result[0].vnos4, result[0].vnos5];
          seznam2 = [result[0].resitev1, result[0].resitev2, result[0].resitev3, result[0].resitev4, result[0].resitev5];
        
          console.log('seznam1 ' + seznam1);
          console.log('seznam2 ' + seznam2);

            async.forEachOfSeries([0,1,2,3,4], function(value2, key2, callback2){

              var uredi = seznamKoda[value1].substring(0, seznamKoda[value1].lastIndexOf('(') + 1) + seznam1[value2] + ')';

              fs.writeFile('script' + value2 + '-' + value1 + '.py', uredi, function(err) {
                if(err) {
                   console.log(err);
                }
                //console.log(uredi);
                console.log("The file was saved!");
              });
              console.log('VALUE2 ' + value2 + ' value1 ' + value1);

              setTimeout(function () {
                
                PythonShell.run('script' + value2 + '-' + value1 + '.py', function (err, results) {
                  if (err) console.log(err);
                  // results is an array consisting of messages collected during execution
                  //console.log(results);
                  if(results){

                    results[0] = results[0].replace('\r', '');
                    //console.log(results[0]);
                    if(results[0] == seznam2[value2]){
                      //console.log('pravilno');
                      
                      dosezeneTocke[value1] += 1;
                    }
                    
                  }else{
                    //console.log('zajebao');
                  }
                  console.log(seznam2[value2]);
                }); 
              }, 100);
                
              callback2();
            }, function(err2, results2){
                //callback1();
            })

        });

        setTimeout(function () {
          callback1();
        }, 2000);

        //callback1();

      }, function(err1, results1){

        console.log('dosezene tocke ' + dosezeneTocke);
        console.log('INSERT INTO `testi1`(`user`, `navodila1`, `koda1`, `navodila2`, `koda2`, `navodila3`, `koda3`, `navodila4`, `koda4`) VALUES (' + JSON.stringify(sess.ime) + ', ' + JSON.stringify(podatki.nal1) + ', ' + JSON.stringify(podatki.koda1) + ', ' + JSON.stringify(podatki.nal2) + ', ' + JSON.stringify(podatki.koda2) + ', ' + JSON.stringify(podatki.nal3) + ', ' + JSON.stringify(podatki.koda3) + ', ' + JSON.stringify(podatki.nal4) + ', ' + JSON.stringify(podatki.koda4) + ')');
        
        con.query('INSERT INTO `testi1`(`user`, `navodila1`, `koda1`, `navodila2`, `koda2`, `navodila3`, `koda3`, `navodila4`, `koda4`) VALUES (' + JSON.stringify(sess.ime) + ', ' + JSON.stringify(podatki.nal1) + ', ' + JSON.stringify(podatki.koda1) + ', ' + JSON.stringify(podatki.nal2) + ', ' + JSON.stringify(podatki.koda2) + ', ' + JSON.stringify(podatki.nal3) + ', ' + JSON.stringify(podatki.koda3) + ', ' + JSON.stringify(podatki.nal4) + ', ' + JSON.stringify(podatki.koda4) + ')', function (error5, result5) {

          
          con.query('INSERT INTO `tocke`(`naloga1`, `naloga2`, `naloga3`, `naloga4`, `idTesta`) VALUES (' + dosezeneTocke[0] + ', ' + dosezeneTocke[1] + ', ' + dosezeneTocke[2] + ', ' + dosezeneTocke[3] + ', ' + result5.insertId + ')', function (error6, result6) {
            console.log(result6);
            res.send({data: '/test/' + result5.insertId});


          });
        
        });

      });


  });

app.get('/vsiDijaki', function(req, res){
  pool.query('SELECT * FROM uporabniki', function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    res.render('dijaki', {dijaki: results });
  });

});

app.get('/dijak/:id', function(req,res){
  let id = req.params.id;

  pool.query('SELECT * FROM testi1 WHERE user="' + id + '"', function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    res.render('pregledDijak', {
      testi: results,
      dijak: id  
    });
  });

});

app.get('/test/:id', function(req,res){
  let id = req.params.id;

  pool.query('SELECT `testi1`.`idTesta` , `testi1`.`user` , `testi1`.`navodila1` , `testi1`.`koda1` , `testi1`.`navodila2` , `testi1`.`koda2` , `testi1`.`navodila3` , `testi1`.`koda3` , `testi1`.`navodila4` , `testi1`.`koda4` , `n1`.`navodila` AS `n1Navodila` , `n2`.`navodila` AS `n2Navodila` , `n3`.`navodila` AS `n3Navodila` , `n4`.`navodila` AS `n4Navodila` , `tocke`.`idTocke` , `tocke`.`naloga1` , `tocke`.`naloga2` , `tocke`.`naloga3` , `tocke`.`naloga4` , `tocke`.`idTesta` FROM `testi1` JOIN `tocke` ON `testi1`.`idTesta` = `tocke`.`idTesta` JOIN `naloge` AS n1 ON `testi1`.`navodila1` = `n1`.`idnaloge` JOIN `naloge` AS n2 ON `testi1`.`navodila2` = `n2`.`idnaloge` JOIN `naloge` AS n3 ON `testi1`.`navodila3` = `n3`.`idnaloge` JOIN `naloge` AS n4 ON `testi1`.`navodila4` = `n4`.`idnaloge`  WHERE `testi1`.`idTesta` =' + id, function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    res.render('pregledTest', {
      test: results[0],
      idT: 'test ' + id
    });
  });

});



app.get('/mojiTesti', function(req, res){
  pool.query('SELECT * FROM testi1 WHERE user="' + sess.ime + '"', function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    res.render('pregledDijak', {
      testi: results,
      dijak: sess.ime
    });
  });

});


app.get('/adminDodaj', function(req,res){
    res.sendfile('./public/adminDodaj.html');
});

app.post('/dodajNalogo', function(req,res){
    x = req.body;

  pool.query('INSERT INTO `naloge`(`navodila`, `pike`, `tipNaloge`) VALUES ("' + x.navodila + '",' + x.tocke + ',"' + x.tip + '")', function (error, result) {
      console.log(result);
      console.log("INSERT INTO `resitve`(`idNaloge`, `vnos1`, `resitev1`, `vnos2`, `resitev2`, `vnos3`, `resitev3`, `vnos4`, `resitev4`, `vnos5`, `resitev5`) VALUES (" + result.insertId + ", `" + x.vnos1 + "`,`" + x.resitev1 + "`,`" + x.vnos2 + "`,`" + x.resitev2 + "`,`" + x.vnos3 + "`,`" + x.resitev3 + "`,`" + x.vnos4 + "`,`" + x.resitev4 + "`,`" + x.vnos5 + "`,`" + x.resitev5 + "`)");
      pool.query("INSERT INTO `resitve`(`idNaloge`, `vnos1`, `resitev1`, `vnos2`, `resitev2`, `vnos3`, `resitev3`, `vnos4`, `resitev4`, `vnos5`, `resitev5`) VALUES (" + result.insertId + ", '" + x.vnos1 + "','" + x.resitev1 + "','" + x.vnos2 + "','" + x.resitev2 + "','" + x.vnos3 + "','" + x.resitev3 + "','" + x.vnos4 + "','" + x.resitev4 + "','" + x.vnos5 + "','" + x.resitev5 + "')", function (error1, result1) {
        console.log(result1);
        res.redirect('/adminDodaj');
    
    });

  });


});

app.get('/adminUrejaj', function(req, res){
    res.sendfile('./public/adminUrejaj.html');
});

app.get('/getNalogeInResitve', function(req, res){

  pool.getConnection(function(err, connection) {
    // Use the connection
    connection.query('SELECT * FROM naloge JOIN resitve ON naloge.idnaloge = resitve.idNaloge', function (error, results, fields) {

      console.log(results);
      res.send(results);
      // And done with the connection.
      connection.release();
   
      // Handle error after the release.
      if (error) throw error;
   
      // Don't use the connection here, it has been returned to the pool.
    });
  });

});

app.post('/updateNaloga', function(req, res){
    var podatki = req.body;

    pool.query('UPDATE `naloge` SET `navodila`= "' + podatki.navodila + '", `pike`= "' + podatki.pike + '",`tipNaloge`= "' + podatki.tipNaloge + '" WHERE `idnaloge` = ' + podatki.id, function (error, results, fields) {
      if (error) throw error;
      console.log(results);
      
    });

    console.log("UPDATE `resitve` SET `vnos1`= '" + podatki.vnos1 + "',`resitev1`= '" + podatki.resitev1 + '",`vnos2`= `' + podatki.vnos2 + '`,`resitev2`= `' + podatki.resitev2 + '`,`vnos3`= `' + podatki.vnos3 + '`,`resitev3`= `' + podatki.resitev3 + '`,`vnos4`= `' + podatki.vnos4 + '`,`resitev4`= `' + podatki.resitev4 + '`,`vnos5`= `' + podatki.vnos5 + '`,`resitev5`= `' + podatki.resitev5 + '` WHERE `idNaloge` = ' + podatki.id);
    pool.query("UPDATE `resitve` SET `vnos1`= '" + podatki.vnos1 + "',`resitev1`= '" + podatki.resitev1 + "',`vnos2`= '" + podatki.vnos2 + "',`resitev2`= '" + podatki.resitev2 + "',`vnos3`= '" + podatki.vnos3 + "',`resitev3`= '" + podatki.resitev3 + "',`vnos4`= '" + podatki.vnos4 + "',`resitev4`= '" + podatki.resitev4 + "',`vnos5`= '" + podatki.vnos5 + "',`resitev5`= '" + podatki.resitev5 + "' WHERE `idNaloge` = " + podatki.id, function (error, results, fields) {
      if (error) throw error;
      console.log(results);
      res.redirect('/adminNaloge');
      
    });

});


app.listen(3000);

