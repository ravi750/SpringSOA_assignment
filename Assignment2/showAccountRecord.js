import { LightningElement, track, wire } from 'lwc';
import fetchAccount from '@salesforce/apex/AccountController.fetchAccount';

export default class ShowAccountRecord extends LightningElement {
    @track objAcc;

    columns = [
        {label:'Name', fieldName:'Name', type: 'text'},
        {label:'Phone', fieldName:'Phone', type: 'phone'},
        {label:'Industry', fieldName:'Industry', type: 'text'}
    ]

    @wire(fetchAccount)
    accounts(results){
        console.log('results=== '+results);
        this.objAcc = results;
        if(results.error){
            this.objAcc = undefined;
        }
    }




}