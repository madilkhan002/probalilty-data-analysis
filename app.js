var R = require("r-integration");
const express = require('express');
const app = express();

const controller = require('./controllers/confirmcases')

app.use(express.static('public'));
app.set('view engine','ejs');

// main menu
app.get('/',(req,res)=>{
    res.render('Graphs/dashBoard');
})

//confirm cases
app.get('/confirmCasesBoxPlot',(req,res)=>{
    R.executeRScript("./scripts/confirmCasesHistogram.R");
    res.render('Graphs/confirmCasesBoxPlot');
})

app.get('/confirmcaseshistogram',(req,res)=>{
    R.executeRScript("./scripts/confirmCasesHistogram.R");
    res.render('Graphs/confirmCasesHistogram');
})

//death cases
app.get('/deathcaseshistogram',(req,res)=>{
    R.executeRScript("./scripts/deathCasesHistogram.R");
    res.render('Graphs/deathCasesHistogram');
})

app.get('/deathcasesboxplot',(req,res)=>{
    R.executeRScript("./scripts/deathCasesBoxPlot.R");
    res.render('Graphs/deathCasesBoxPlot');
})

//recovered cases
app.get('/recoverdcaseshistogram',(req,res)=>{
    R.executeRScript("./scripts/recoveredCasesHistogram.R");
    res.render('Graphs/recoveredCasesHistogram');
})

app.get('/recoverdcasesboxplot',(req,res)=>{
    R.executeRScript("./scripts/recoveredCasesBoxPlot.R");
    res.render('Graphs/recoveredCasesBoxPlot');
})

//Statistics

//Confirmed Cases
app.get('/statisticsconfirmcases',(req,res)=>{
    const result = R.executeRScript("./scripts/statConfirmCases.R");
    res.render('Statistics/statConfirmCases',{median : result[1],iqr : result[2],total : result[3]})
})

//Death Cases
app.get('/statisticsdeathcases',(req,res)=>{
    const result = R.executeRScript("./scripts/statDeathCases.R");
    res.render('Statistics/statDeathCases',{median : result[1],iqr : result[2],total : result[3]})
})

//Recovered Cases
app.get('/statisticsrecoveredcases',(req,res)=>{
    const result = R.executeRScript("./scripts/statRecoveredCases.R");
    res.render('Statistics/statRecoveredCases',{median : result[1],iqr : result[2],total : result[3]})
})

const PORT = process.env.PORT || 8000;

app.listen(PORT,err => console.log('Listeining 8000 Port'))
