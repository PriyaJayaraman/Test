CREATE OR REPLACE PACKAGE  northstg.master_load_pkg
AS
  PROCEDURE update_load_rec_count (v_count number, p_filename varchar2);
END
/

CREATE OR REPLACE PACKAGE BODY northstg.master_load_pkg
AS
  PROCEDURE update_load_rec_count (v_count number, p_filename varchar2)
   IS
   BEGIN
      UPDATE north.test_load
         SET load_record_count = v_count,
             load_end_date = SYSDATE,
             status = 'loaded'
       WHERE load_seq = SUBSTR (p_filename, 2);

      DBMS_OUTPUT.PUT_LINE (v_count || ' north.test_load updated');
      COMMIT;
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.PUT_LINE (
            'ERROR WHILE UPDATING DATA INTO north.test_load');
         RAISE;
   END update_load_rec_count;
END
/
