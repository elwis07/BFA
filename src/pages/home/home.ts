import { Component } from '@angular/core';
import { NavController, ToastController, AlertController, LoadingController, NavParams } from 'ionic-angular';
import { FormBuilder, Validators } from '@angular/forms';
import { MyProvider } from '../../providers/my/my';

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

}
 