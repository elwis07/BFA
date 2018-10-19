import { Component } from '@angular/core';
import { AlertController, LoadingController, NavController} from 'ionic-angular';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { MyProvider } from '../../providers/my/my';
import { HomePage } from '../home/home';
import { InscriptionPage } from '../inscription/inscription';


@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {

  public loginForm: any;
  public backgroundImage = 'assets/img/background/background-5.jpg';

  pseudo:String
  motDePasse:String
  public items : Array<any> = [];
  loading:any;

  constructor(
    public loadingCtrl: LoadingController,
    public alertCtrl: AlertController,
    public http   : HttpClient,
    public data       :MyProvider,
    public navCtrl: NavController
  ) { }

  login():void {
    if(this.pseudo==null|| this.motDePasse==null||this.pseudo==""|| this.motDePasse=="" )
    {
        this.showAlert('Veuillez entrer votre pseudo et votre mot de passe');
    }
    else
    {
      this.presentLoading();
      this.data.login(this.pseudo,this.motDePasse)
      .subscribe((data : any) =>
      {
        console.dir(data);
        this.items = data;
         
      },
      (error : any) =>
      {
        console.dir(error);
        this.loading.dismiss(); 
        this.showAlert('Veuillez vérifer votre connexion internet.');
      },()=>
      {
        this.loading.dismiss();
        if(this.items.length==0){
          this.showAlert('Pseudo ou Mot de passe invalide!');
        }else{
          this.showRadio(this.items)

        }
      });
    
     
    }
    
    console.log(this.pseudo);
    console.log(this.motDePasse);
  }

  showRadio(arg:any) {
    if(arg.length==1){
      if(arg[0].comptaActif==null||arg[0].comptaActif==0){
       this.showAlert('Veuillez vous rapprocher de l\'administrateur de votre hopital pour activer votre compte')
      }else{
        this.navCtrl.push(HomePage,{data:arg});
      }
      
    }else{
      let alert = this.alertCtrl.create();
      alert.setTitle('sélection de l\'hopital');
      for(let item in arg){
        if(item=='0'){
          alert.addInput({
            type: 'radio',
            label: arg[item].nom_hopital,
            value: arg[item].compteActif,
            checked: true});
        }else{
          alert.addInput({
            type: 'radio',
            label: arg[item].nom_hopital,
            value: arg[item].compteActif,
          });
        }
      }
      alert.addButton('Cancel');
      alert.addButton({
      text: 'OK',
      handler: data => {
        if(data!=1){
          this.showAlert('Veuillez vous rapprocher de l\'administrateur de votre hopital pour activer votre compte') 
        }else {
          this.navCtrl.push(HomePage,{data:arg});
        }
      }
      });
      alert.present();
    }

  }
  presentLoading(){
    this.loading = this.loadingCtrl.create({
      duration: 5000
    });
    this.loading.present();
  }  

  showAlert(message:any){
    const alert = this.alertCtrl.create({
      // title: 'Vérifier vos données ainsi que votre connection',
       subTitle:message,
       buttons: ['Ok']
     });
     alert.present();
  }


  goToSignup() {
    this.navCtrl.push(InscriptionPage);
  }

  goMotDePasseOubli() {
    //console.log(this.pseudo);
    // this.navCtrl.push(ResetPasswordPage);
  }
}