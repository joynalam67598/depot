import React, { useState, userEffect } from "react";
import NoPayType from "./NoPayType";
import CreditCardPayType from "./CreditCardPayType";
import CheckPayType from "./CheckPayType";
import PurchaseOrderPayType from "./PurchaseOrderPayType";

export default function PayTypeSelector() {
  const [payType, setPayType] = useState("");

  const handleChange = (e) => {
    const { name, value } = e.target;
    setPayType(value);
  };
  return (
    <div>
      <div className="field">
        <label htmlFor="order_pay_type">Pay type</label>
        <select
          id="order_pay_type"
          onChange={handleChange}
          name="orde[pay_type]"
        >
          <option value="">Select a payment method</option>
          <option value="Check">Check</option>
          <option value="Credit card">Credit card</option>
          <option value="Purchase order">Purchase order</option>
        </select>
      </div>
      {payType == "Credit card" ? (
        <CreditCardPayType />
      ) : payType == "Check" ? (
        <CheckPayType />
      ) : payType == "Purchase order" ? (
        <PurchaseOrderPayType />
      ) : (
        <NoPayType />
      )}
    </div>
  );
}
