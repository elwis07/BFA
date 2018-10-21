import { Component } from '@angular/core';
import { NavController, ToastController, AlertController, LoadingController, NavParams } from 'ionic-angular';
import { FormBuilder, Validators } from '@angular/forms';
import { MyProvider } from '../../providers/my/my';
import { BanquesPage } from '../banques/banques';
import { RechercheSangPage } from '../rechercheSang/rechercheSang';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  loading: any;
  form: any;
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"; 
  departements: any = [];
  userGroupes: any = [];
  groupeSanguins: any = []
                public items : Array<any> = [];
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    this.items = navParams.get('data');
    console.dir(this.items);
  }

  gotoPage(id:number):void {
    switch(id)
    {
      
      case 1:
        this.navCtrl.push(BanquesPage);
      break

      case 2:
        this.navCtrl.push(RechercheSangPage);
      break
    }
  }

}
 