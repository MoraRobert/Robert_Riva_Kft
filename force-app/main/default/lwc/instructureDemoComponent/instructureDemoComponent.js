import { LightningElement, api, track } from 'lwc';

export default class InstructureDemoMyFlowComponent extends LightningElement {
    @track inputValue;
    @api
    get value() {
        return this.inputValue;
    }
    set value(value) {
        this.inputValue = value;
    }

    handleChange(event) {
        this.inputValue = event.target.value;
        const valueChangeEvent = new CustomEvent('valuechange', {
            detail: this.inputValue
        });
        this.dispatchEvent(valueChangeEvent);
    }
}
