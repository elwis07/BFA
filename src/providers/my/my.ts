import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

/*
  Generated class for the MyProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class MyProvider {
  public baseURI       : string  = "http://192.168.43.96/ionic_fichier_php/";
  constructor(public http: HttpClient) {
    console.log('Hello MyProvider Provider');
  }


  login(pseudo:any,password:any){
    let headers 	: any		= new HttpHeaders({ 'Content-Type': 'application/json' }),
        options 	: any		= { "key" : "login","pseudo":pseudo,"password":password},
        url       : any      	= this.baseURI + "retrieve-data.php";  
       return  this.http.post(url,JSON.stringify(options), headers);
  }

  insestUser(pseudo:any,nom:any,prenom:any,num:number,password:any,
    departement:any,codeHopital:any,mail:any,groupeSanguin:any,userGroup:any){
    let headers 	: any		= new HttpHeaders({ 'Content-Type': 'application/json' }),
        options 	: any		= { "key" : "create","nom":nom,"pseudo":pseudo,"prenom":prenom,
        "num":num,"password":password,"mail":mail,"departement":departement,"codeHopital":codeHopital,
        "groupeSanguin":groupeSanguin,"userGroupe":userGroup},
        url       : any      	= this.baseURI + "manage-data.php";  
       return  this.http.post(url,JSON.stringify(options), headers);
  }

  getDepartement(){
    let headers 	: any		= new HttpHeaders({ 'Content-Type': 'application/json' }),
        options 	: any		= { "key" : "getDepartement"},
        url       : any      	= this.baseURI + "retrieve-data.php";  
       return  this.http.post(url,JSON.stringify(options), headers);
  }

  getGroupe(){
    let headers 	: any		= new HttpHeaders({ 'Content-Type': 'application/json' }),
        options 	: any		= { "key" : "getGroupe"},
        url       : any      	= this.baseURI + "retrieve-data.php";  
       return  this.http.post(url,JSON.stringify(options), headers);
  }
  getGroupeSanguin(){
    let headers 	: any		= new HttpHeaders({ 'Content-Type': 'application/json' }),
        options 	: any		= { "key" : "getGroupeSanguin"},
        url       : any      	= this.baseURI + "retrieve-data.php";  
       return  this.http.post(url,JSON.stringify(options), headers);
  }

}