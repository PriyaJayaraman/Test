DECLARE

v_supplier_id 	north.suppliers.suppliers%type 		:=NULL;
v_supplier_name north.suppliers.supplier_name%type 	:=NULL;
v_order_date 	north.orders.order_date%type 		:=NULL;

BEGIN

FOR i in (SELECT pltfrm_cd from north.platform_codes)
LOOP
	SELECT s.supplier_id
		  ,s.supplier_name
		  ,o.order_date
      INTO v_supplier_id 
          ,v_supplier_name
	      ,v_order_date
	FROM north.suppliers s
	LEFT OUTER JOIN north.orders o
	ON s.supplier_id = o.supplier_id
	WHERE s.pltfrm_cd = i.pltfrm_cd
	;

	DBMS_OUTPUT.PUT_LINE('Supplier ID ' || v_supplier_id);
	DBMS_OUTPUT.PUT_LINE('Supplier Name ' || v_supplier_name);
	DBMS_OUTPUT.PUT_LINE('Supplier Order Date ' || v_order_date);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No datafound for the supplierID or PlatformCode');  

  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Multiple records found for the supplierID or PlatformCode');
    
END LOOP;	

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error Occurred'|| SUBSTR(SQLERRM, 1, 255));
END;