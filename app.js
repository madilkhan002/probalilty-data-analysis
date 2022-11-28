var R = require("r-integration");
const express = require('express');
const app = express();

const controller = require('./controllers/confirmcases')

app.use(express.static('public'));
app.set('view engine','ejs');

// main menu
app.get('/',(req,res)=>{
    res.render('menu');
})

//Graphics

//confirm cases
app.get('/confirmcaseshistogram',(req,res)=>{
    R.executeRScript("./scripts/confirmCasesHistogram.R");
    res.render('confirmCasesHistogram');
})

app.get('/confirmcasesboxplot',(req,res)=>{
    R.executeRScript("./scripts/confirmCasesBoxPlot.R");
    res.render('confirmCasesBoxPlot');
})

//death cases
app.get('/deathcaseshistogram',(req,res)=>{
    R.executeRScript("./scripts/deathCasesHistogram.R");
    res.render('deathCasesHistogram');
})

app.get('/deathcasesboxplot',(req,res)=>{
    R.executeRScript("./scripts/deathCasesBoxPlot.R");
    res.render('deathCasesBoxPlot');
})

//recovered cases
app.get('/recoverdcaseshistogram',(req,res)=>{
    R.executeRScript("./scripts/recoveredCasesHistogram.R");
    res.render('recoveredCasesHistogram');
})

app.get('/recoverdcasesboxplot',(req,res)=>{
    R.executeRScript("./scripts/recoveredCasesBoxPlot.R");
    res.render('recoveredCasesBoxPlot');
})

//Statistics

//Confirmed Cases
app.get('/statisticsconfirmcases',(req,res)=>{
    const result = R.executeRScript("./scripts/statConfirmCases.R");
    res.render('statConfirmCases',{median : result[1],iqr : result[2],total : result[3]})
})

//Death Cases
app.get('/statisticsdeathcases',(req,res)=>{
    const result = R.executeRScript("./scripts/statDeathCases.R");
    res.render('statDeathCases',{median : result[1],iqr : result[2],total : result[3]})
})

//Recovered Cases
app.get('/statisticsrecoveredcases',(req,res)=>{
    const result = R.executeRScript("./scripts/statRecoveredCases.R");
    res.render('statRecoveredCases',{median : result[1],iqr : result[2],total : result[3]})
})


app.listen(8000,err => console.log('Listeining 8000 Port'))
