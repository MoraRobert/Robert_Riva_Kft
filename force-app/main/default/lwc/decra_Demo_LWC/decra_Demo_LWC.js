import { LightningElement, api, wire } from 'lwc';
import getSObjectRecods from '@salesforce/apex/Demo_FSM_Controller.getSObjectRecords';
import {NavigationMixin} from 'lightning/navigation';

const columns = [    
    { label: 'Subject', fieldName: 'Subject' },
    { label: 'Status', fieldName: 'Status' },
    { label: 'Priority', fieldName: 'Priority' },
    { label: 'Description', fieldName: 'Description' },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' }
];

export default class Decra_Demo_LWC extends LightningElement {

    @api recordId;
    columns = columns;

    @wire(getSObjectRecods, { accountId: '$recordId'})
    workOrders;    
}