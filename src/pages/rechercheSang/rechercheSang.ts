import { Component } from '@angular/core';
import { NavController, ToastController, AlertController, LoadingController, NavParams } from 'ionic-angular';
import { FormBuilder, Validators } from '@angular/forms';
import { MyProvider } from '../../providers/my/my';

@Component({
  selector: 'page-rechercheSang',
  templateUrl: 'rechercheSang.html'
})
export class RechercheSangPage {
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    
  }
}