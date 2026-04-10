DECLARE
    TYPE t_sales IS TABLE OF NUMBER INDEX BY VARCHAR(30);
    v_sales sales;

BEGIN
    SELECT NVL(COUNT(order_id,0) FROM ORDERS order LEFT JOIN r.EMPLOYERS em ON em.employers_id = order WHERE or.status='Shiped' AND 
    em.first);

    SELECT COUNT(o.order_id) INTO v_sales('Blake') FROM orders o
    JOIN employees e ON e.employee_id = o.salesman_id WHERE o.status = 'Shipped' AND e.first_name = 'Blake';

    SELECT COUNT(o.order_id) INTO v_sales('Daisy') FROM orders o
    JOIN employees e ON e.employee_id = o.salesman_id WHERE o.status = 'Shipped' AND e.first_name = 'Daisy';
    SELECT COUNT(o.order_id) INTO v_sales('Lily') FROM orders o
    JOIN employees e ON e.employee_id = o.salesman_id WHERE o.status = 'Shipped' AND e.first_name = 'Lily';
    v_sales('Blake') := 10;
    v_sales('Daisy') := 6;
    v_sales('Lily') := 8;

    DBMS_OUTPUT.PUT_LINE(v_sales(v_sales.FIRST));
END;
