This is a Class Project Database for en E-Commerce Website.

SELECT 
  payments_id,
  order_id,
  card_id,
  payment_status,
  payment_date,
  user_id,
  CASE 
    WHEN payment_status = 'pending' THEN 'Payment is being processed'
    WHEN payment_status = 'completed' THEN 'Payment completed successfully'
    WHEN payment_status = 'failed' THEN 'Payment failed, please retry'
    ELSE 'Unknown payment status'
  END AS payment_status_label
FROM ecommercedb.payments;

Team Members:
Danny Anaya
Andrew Jones
Jacob Oliver
Garrett Davis
Ian Miller
Efrain Miller
