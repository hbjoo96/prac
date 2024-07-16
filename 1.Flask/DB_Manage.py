import cx_Oracle

def db_conn() :
    try :
        conn = cx_Oracle.connect("hr", "12345", "localhost:1521/xe")
        cur = conn.cursor()
        print("DB 연결 성공")

        return conn, cur
    except cx_Oracle.DatabaseError as e :
        print(e)

def db_disconn(conn, cur) :
    cur.close()
    conn.close()
    print("DB 연결종료")

def db_search(cur, id_val, pw_val) :
    sql = f"select code, name, age from member_tbl where id_val='{id_val}' and pw_val='{pw_val}'"

    print(sql)

    try :
        cur.execute(sql)
        print("데이터 검색 완료")
        return cur.fetchone()
    except cx_Oracle.DatabaseError as e :
        print(e)
