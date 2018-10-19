import { Component } from '@angular/core';
import { NavController, ToastController, AlertController, LoadingController } from 'ionic-angular';
import { FormBuilder, Validators } from '@angular/forms';
import { MyProvider } from '../../providers/my/my';
import { LoginPage } from '../login/login';

@Component({
  selector: 'page-inscription',
  templateUrl: 'inscription.html'
})
export class InscriptionPage {
  loading: any;
  form: any;
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"; 
  departements: any = [];
  userGroupes: any = [];
  groupeSanguins: any = [];
  constructor(public navCtrl: NavController, 
               public fb   : FormBuilder,
               public loadingCtrl: LoadingController,
               public alertCtrl: AlertController,
               public data       :MyProvider,
               public toastCtrl  : ToastController,) {


    this.form = fb.group({
      "pseudo"       : ["", [Validators.required,Validators.maxLength(21),
                        Validators.minLength(4)]],
      "nom"          : ["", Validators.required],
      "prenom"       : ["", Validators.required],
      "num"          : ["", Validators.required],
      "password"     : ["", [Validators.required,Validators.minLength(6)]],
      "codeHopital"  : ["", Validators.required],
      "mail"         : ["", [Validators.required,
                       Validators.pattern(this.emailPattern)]],
      "departement"  : ["", Validators.required],
      "groupeSanguin" : ["", Validators.required],
      "userGroupe"    :      ["", Validators.required],
      "confirmPwd"   :    ["", Validators.required]
   });
   
   this.getUserGroup()
   this.getGroupeSanguin()
   this.getDepartement()
   
  }

  getUserGroup() : void
  {
    let resultat: any[]=[]
    this.presentLoading();
    this.data.getGroupe()
    .subscribe((data:any=[] )=>{
      console.log(data);
       resultat=data;
      },(error : any) =>{
        this.loading.dismiss();
        this.sendAlert("Veuillez vérifer votre connexion internet.");
        console.log(error);
      },()=>{
        this.loading.dismiss();
        for(let i:number=0;i<resultat.length;i++)
        {
          if(resultat[i].id!=1 && resultat[i].id!=4)
          {
            this.userGroupes.push(resultat[i]);
          }
            
        } 
      console.log(this.userGroupes);
     });
  }

  getGroupeSanguin() : void
  {
    let resultat: any[]=[]
    this.data.getGroupeSanguin()
    .subscribe((data:any=[] )=>{
      console.log(data);
       resultat=data;
       console.log(data);
      },(error : any) =>{
        this.sendAlert("Veuillez vérifer votre connexion internet.");
        console.log(error);
      },()=>{
        for(let i:number=0;i<resultat.length;i++)
        {
          this.groupeSanguins.push(resultat[i]);
        } 
      console.log(this.groupeSanguins);
     });
  }

  getDepartement() : void
  {
    let resultat: any[]=[]
    this.data.getDepartement()
    .subscribe((data:any=[] )=>{
      console.log(data);
       resultat=data;
       console.log(data);
      },(error : any) =>{
        this.sendAlert("Veuillez vérifer votre connexion internet.");
        console.log(error);
      },()=>{
        for(let i:number=0;i<resultat.length;i++)
        {
            this.departements.push(resultat[i]);
        } 
      console.log(this.departements);
     });
  }

  register() : void
  {
    
    let invalidInput=false;
    const controls = this.form.controls;
    console.log(this.form.get('confirmPwd').value)
    console.log(this.form.get('password').value)
    if(this.form.get('confirmPwd').value==this.form.get('password').value)
    {
      for (const name in controls) 
      {
        if (controls[name].invalid) {
            invalidInput=true;
            if(name=='pseudo')
            {
              this.sendNotification("Le pseudo doit pas être vide et doit contenir 21 caractères au maxi")
              break
            }
            else if(name=='nom'|| name=='prenom'||name=='num'||name=='departement'||name=='groupeSanguin'||name=='userGroupe')
            {
              this.sendNotification("Le champ "+name+"doit pas être vide")
              break
            }
            else if(name=='password')
            {
              this.sendNotification("Le Mot de passe  doit pas être vide et doit contenir au moins 6 caractères")
              break
            }
            else if(name=='mail')
            {
              this.sendNotification("Email invalid")
              break
            }
      
        } 
      }
      if(!invalidInput)
      {
        let retour:any
        this.presentLoading();
        this.data.insestUser(this.form.get('pseudo').value,this.form.get('nom').value,this.form.get('prenom').value,
                            this.form.get('num').value,this.form.get('password').value,this.form.get('departement').value,
                            this.form.get('codeHopital').value,this.form.get('mail').value,this.form.get('groupeSanguin').value
                            ,this.form.get('userGroupe').value)
                            .subscribe((data:any)=>{
                              retour=data;
                            },
                            (error:any)=>{
                              this.loading.dismiss();
                              this.sendAlert("Veuillez vérifer votre connexion internet.");
                              console.log(error);
                            },()=>{
                              this.loading.dismiss();
                              console.log(retour.message);
                              if(retour.message=="Success")
                              {
                                this.sendNotification("Félicitation!!!Inscription Reuissie.");
                                this.navCtrl.push(LoginPage)
                                console.log("success")
                              }
                              else if(retour.message=="error")
                              {
                                this.sendAlert("Une erreur s'est produite. Réessayez!");
                              }
                              else 
                              {
                                this.sendAlert(retour.message);
                              }
                              
                            });
      }
      else
      {
        return
      }
    }
    else
    {
      this.sendNotification("Les Mot de passes  ne correspondent pas");
      return
    } 
  }

  sendNotification(message : string)  : void
  {
    let notification = this.toastCtrl.create({
        message       : message,
        duration      : 3000
    });
    notification.present();
  }
   sendAlert(message:string) {
    let alert = this.alertCtrl.create({
      title: 'Notification',
      subTitle: message,
      buttons: 
      [
        {
            text: 'OK',
            handler: () => 
            {
              
            }
        }
      ]
    });
    alert.present();
  }

  presentLoading() {
 
    this.loading = this.loadingCtrl.create({
        content: 'Patientez un instant....'
    });
 
    this.loading.present();
  }

  gotoLogin():void
   {
     this.navCtrl.push(LoginPage);
   }
}
