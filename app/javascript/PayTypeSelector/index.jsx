import React from "react";

export default function PayTypeSelector() {
  const handleChange = (e) => {
    const { name, value } = e.target;
    console.log(value);
  };
  return (
    <div className="field">
      <label htmlFor="order_pay_type">Pay type</label>
      <select id="order_pay_type" onChange={handleChange} name="orde[pay_type]">
        <option value="">Select a payment method</option>
        <option value="Check">Check</option>
        <option value="Credit card">Credit card</option>
        <option value="Purchase order">Purchase order</option>
      </select>
    </div>
  );
}
