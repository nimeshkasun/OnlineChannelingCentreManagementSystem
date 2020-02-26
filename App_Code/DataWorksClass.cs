using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;
using System.Collections;

public class DataWorksClass
{
    public DataWorksClass(string constring)
    {
        this.constring = constring;
    }

     
    // private data fields
    private SqlConnection sqlConn;
    SqlCommand sqlCmd;
    SqlDataReader sqlDataReader;
    SqlDataAdapter sqldataAdapter;
    DataTable dt;
    DataSet ds;
    string constring;
    string _errmessage = "";
    SqlTransaction sqlTrans = null;

    public string ConnString
    {
        set
        {
            this.constring = value;
        }
    }

    public SqlConnection SQLConn
    {
        get
        {
            return this.sqlConn;
        }

        set
        {
            this.sqlConn = value;
        }
    }


    

    public string ErrMsg
    {
        get
        {
            return this._errmessage;
        }
    }

    #region Select Statement
    public void SetDataAdapter(string sqlselect)
    {
        sqlConn = new SqlConnection(constring);
        this.sqldataAdapter = new SqlDataAdapter(sqlselect, sqlConn);
    }

    public void SetCommand(string stringCommand)
    {
       sqlConn = new SqlConnection(constring);
        this.sqlCmd = new SqlCommand(stringCommand, sqlConn);
    }

    public void SetCommand()
    {
        sqlConn = new SqlConnection(constring);
        this.sqlCmd = new SqlCommand();
        this.sqlCmd.Connection = sqlConn;
    }

    public void SetConection(string stringCommand)
    {
        sqlConn = new SqlConnection(constring);
    }

    public void SetCommand(SqlConnection sqlcon, string stringCommand)
    {
        this.sqlCmd = new SqlCommand(stringCommand, sqlcon);
    }


    #endregion

    #region Set Data Adapter Parameters
    public void SetDataAdapterParameters(string paramName, string ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetDataAdapterParameters(string paramName, int ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }


    public void SetDataAdapterParameters(string paramName, DateTime ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }


    public void SetDataAdapterParameters(string paramName, long ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetDataAdapterParameters(string paramName, decimal ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetDataAdapterParameters(string paramName, double ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetDataAdapterParameters(string paramName, bool ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetDataAdapterParameters(string paramName, short ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetDataAdapterParameters(string paramName, float ParamVal)
    {
        this.sqldataAdapter.SelectCommand.Parameters.AddWithValue(paramName, ParamVal);
    }


    #endregion

    #region Select Methods

    
    //Get DataTable
    public DataTable GetDataTable()
    {

        this.dt = new DataTable();

        try
        {
            
            this.sqlConn.Open();
            this.sqldataAdapter.Fill(this.dt);
        }
        catch (Exception er)
        {
            this._errmessage = er.Message;
            return null;
        }

        finally
        {
            sqlConn.Close();
            sqlConn.Dispose();
        }

        return dt;

        }

    public DataSet GetDataSet()
    {

        this.ds = new DataSet();

        try
        {

            this.sqlConn.Open();
            this.sqldataAdapter.Fill(this.ds, "TestTrans");
        }
        catch (Exception er)
        {
            this._errmessage = er.Message;
            return null;
        }

        finally
        {
            sqlConn.Close();
            sqlConn.Dispose();
        }

        return ds;

    }

    //Get Data from a command
    public string[] GetDataArray()
    {
        string[] strArr = null;
        try
        {
            sqlConn.Open();
            sqlDataReader = sqlCmd.ExecuteReader();
            sqlDataReader.Read();
            // Array size of output column
            strArr = new string[sqlDataReader.FieldCount];
            for (int i = 0; i < sqlDataReader.FieldCount; i++)
            {
                if (sqlDataReader.HasRows == true)
                {
                    strArr[i] = sqlDataReader[i].ToString();
                }
            }

            sqlDataReader.Close();

        }

        catch (Exception err)
        {
            this._errmessage = err.Message;
            return null;
        }

        finally
        {
            sqlConn.Close();
        }

        return strArr;

    }

    // Get Single Value
    public string GetSingleData()
    {
        // string output
        string value = "0";
        try
        {
            sqlConn.Open();
            sqlDataReader = sqlCmd.ExecuteReader();
            sqlDataReader.Read();

            if (sqlDataReader.HasRows == true)
            {
                try
                {
                    value = sqlDataReader[0].ToString();
                    if (value == "")
                    {
                        value = "0";
                    }
                }
                catch
                {
                    value = "0";
                }
            }
         
            sqlDataReader.Close();

        }

        catch (Exception err)
        {
            this._errmessage = err.Message;
            return null;
        }

        finally
        {
            sqlConn.Close();
        }

        return value;
    }

    #endregion

    #region Set sqlCommand Parameters
    public void SetSqlCommandParameters(string paramName, string ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetSqlCommandParameters(string paramName, int ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }


    public void SetSqlCommandParameters(string paramName, DateTime ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }


    public void SetSqlCommandParameters(string paramName, long ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetSqlCommandParameters(string paramName, decimal ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetSqlCommandParameters(string paramName, double ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetSqlCommandParameters(string paramName, bool ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetSqlCommandParameters(string paramName, short ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }

    public void SetSqlCommandParameters(string paramName, float ParamVal)
    {
        this.sqlCmd.Parameters.AddWithValue(paramName, ParamVal);
    }


    #endregion

    #region Insert Methods



    public int Insert()
    {
        int rowAdded = 0;

        try
        {
            sqlConn.Open();
            rowAdded = sqlCmd.ExecuteNonQuery();
        }

        catch (Exception err)
        {
            _errmessage = err.Message;
        }

        finally
        {
            sqlConn.Close();
            sqlConn.Dispose();
        }

        return rowAdded;
    }


    public void InsertBulk(DataTable dt, string tablename)
    {
        // connect to SQL
        using (SqlConnection connection =
                new SqlConnection(this.constring))
        {
            // make sure to enable triggers
            // more on triggers in next post
            SqlBulkCopy bulkCopy =
                new SqlBulkCopy
                (
                connection,
                SqlBulkCopyOptions.TableLock |
                SqlBulkCopyOptions.FireTriggers |
                SqlBulkCopyOptions.UseInternalTransaction|
                SqlBulkCopyOptions.KeepIdentity,
                null
                );

            // set the destination table name
            bulkCopy.DestinationTableName = tablename;
            connection.Open();

            // write the data in the "dataTable"
            bulkCopy.WriteToServer(dt);            
            connection.Close();
        }
        // reset
        dt.Clear();
    }

    public string InsertandReturnID()
    {
        string id = "0";
        try
        {
            sqlConn.Open();
            id = sqlCmd.ExecuteScalar().ToString();
        }

        catch (Exception err)
        {
            _errmessage = err.Message;
        }

        finally
        {
            sqlConn.Close();
            sqlConn.Dispose();
        }

        return id;
    }


    //public string Insert(SqlConnection sqlcon)
    //{
    //    int rowAdded = 0;
    //    this.sqlConn = sqlcon;

    //    try
    //    {
    //        this.sqlConn.Open();
    //        rowAdded = sqlCmd.ExecuteNonQuery();
    //        sqlTrans.Commit();
    //    }

    //    catch (Exception err)
    //    {
    //        _errmessage = err.Message;
    //        this.sqlTrans.Rollback();
    //    }

    //    finally
    //    {
    //        sqlTrans.Dispose();
    //        sqlConn.Close();
    //        sqlConn.Dispose();
    //    }

    //    _errmessage += rowAdded.ToString();
    //    return _errmessage;
    //}


    //public int Insert(SqlConnection sqlCon)
    //{
        
    //    int rowAdded = 0;
    //    this.sqlTrans = sqlCon.BeginTransaction();
    //    try
    //    {
    //        sqlConn.Open();
    //        rowAdded = sqlCmd.ExecuteNonQuery();
    //    }

    //    catch (Exception err)
    //    {
    //        _errmessage = err.Message;
    //    }

    //    finally
    //    {
    //        sqlConn.Close();
    //        sqlConn.Dispose();
    //    }

    //    return rowAdded;
    //}


    #endregion

    #region Update Methods
    // Update Method
    public int Update()
    {
        int rowAdded = 0;

        try
        {
            sqlConn.Open();
            rowAdded = sqlCmd.ExecuteNonQuery();
        }

        catch (Exception err)
        {
            _errmessage = err.Message;
        }

        finally
        {
            sqlConn.Close();
            sqlConn.Dispose();
        }

        return rowAdded;
    }

    // Update Method
    public int Delete()
    {
        int rowAdded = 0;

        try
        {
            sqlConn.Open();
            rowAdded = sqlCmd.ExecuteNonQuery();
        }

        catch (Exception err)
        {
            _errmessage = err.Message;
        }

        finally
        {
            sqlConn.Close();
            sqlConn.Dispose();
        }

        return rowAdded;
    }
    //public int ProperUpdate()
    //{
    //    SqlTransaction sqlTrans;

    //    int rowAdded = 0;

    //    sqlConn.Open();
    //    sqlTrans = sqlConn.BeginTransaction();
    //    sqlCmd.Connection = sqlConn;
    //    sqlCmd.Transaction = sqlTrans;

    //    try
    //    {
    //        rowAdded = sqlCmd.ExecuteNonQuery();
    //        sqlTrans.Commit();
    //    }

    //    catch (Exception err)
    //    {

    //        try
    //        {
    //            sqlTrans.Rollback();
    //        }
    //        catch (Exception ex2)
    //        {
    //            _errmessage = ex2.Message;
    //        }
    //        _errmessage += err.Message;
    //    }

    //    finally
    //    {
    //        sqlConn.Close();
    //        sqlTrans.Dispose();
    //        sqlConn.Dispose();
    //    }

    //    return rowAdded;
    //}
    #endregion



    #region Transactions 
    public int Trans(string[] statement)
    {
        int rows = 0;
        try
        {
            // BeginTransaction() Requires Open Connection
            sqlConn.Open();

            this.sqlTrans = sqlConn.BeginTransaction();

            // Assign Transaction to Command
            sqlCmd.Transaction = sqlTrans;

            for (int i = 0; i < statement.Length; i++)
            {
                // Execute 1st Command
                this.sqlCmd.CommandText = statement[i];
                rows = sqlCmd.ExecuteNonQuery();
                if (rows == 0)
                {
                        throw new NotImplementedException("Error in GL Accounts");
                }
            }
            _errmessage = "Transaction Completed ";
            sqlTrans.Commit();
        }
        catch(Exception ex)
        {
            sqlTrans.Rollback();
            //throw;
            rows = 0;
            _errmessage = ex.Message + " | " + ex.Source + " | "  + ex.Data + " | " + ex.InnerException + " | " + ex.HelpLink ;
        }

        finally
        {
           
            sqlConn.Close();
        }
        return rows;
    }

    public int Trans(string statement)
    {
        int rows = 0;
        try
        {
            // BeginTransaction() Requires Open Connection
            sqlConn.Open();

            this.sqlTrans = sqlConn.BeginTransaction();

            // Assign Transaction to Command
            sqlCmd.Transaction = sqlTrans;

            // Execute 1st Command
            sqlCmd.CommandText = statement;
            rows = sqlCmd.ExecuteNonQuery();
            if (rows == 0)
            {
                throw new NotImplementedException("Error in GL Accounts");
            }
            //Start Transsaction
            sqlTrans.Commit();
        }
        catch(Exception ex)
        {
            sqlTrans.Rollback();
            _errmessage = ex.Message + " | " + ex.Source + " | " + ex.Data + " | " + ex.InnerException + " | " + ex.HelpLink;
        }

        finally
        {
            sqlConn.Close();
        }
        return rows;
    }

    #endregion




    //public void test()
    //{
    //    //using (SqlConnection connection = DbConnection("SerConstr"))
    //    //{
    //    //using (SqlCommand command = connection.CreateCommand())
    //    //{
    //    SqlTransaction transaction = null;

    //    try
    //    {
    //        connection.Open();

    //        transaction = connection.BeginTransaction();




    //        command.Transaction = transaction;



    //        // i need to perform this in con1
    //        command.CommandText = "Insert ...";
    //        command.ExecuteNonQuery();

    //        // Execute i need to perform this in con2
    //        command.CommandText = "Update...";
    //        command.ExecuteNonQuery();

    //        transaction.Commit();
    //    }
    //    catch
    //    {
    //        transaction.Rollback();
    //        throw;
    //    }
    //    finally
    //    {
    //        connection.Close();
    //    }

    //}



    //public int ProperInsert()
    //{
    //    SqlTransaction sqlTrans = null;

    //    int rowAdded = 0;
    //    try
    //    {
    //        sqlConn.Open();
    //        sqlTrans = sqlConn.BeginTransaction();
    //        sqlCmd.Connection = sqlConn;
    //        sqlCmd.Transaction = sqlTrans;
    //        rowAdded = sqlCmd.ExecuteNonQuery();
    //        sqlTrans.Commit();
    //    }

    //    catch (Exception err)
    //    {

    //        sqlTrans.Rollback();
    //        throw;
    //    }

    //    finally
    //    {
    //        sqlConn.Close();
    //        sqlTrans.Dispose();
    //        sqlConn.Dispose();
    //    }

    //    return rowAdded;
    //}


    //sqlConn.Open();
    //  sqlTrans = sqlConn.BeginTransaction();
    //  sqlCmd.Connection = sqlConn;
    //  sqlCmd.Transaction = sqlTrans;

    //  try
    //  {
    //      rowAdded = sqlCmd.ExecuteNonQuery();
    //      sqlTrans.Commit();
    //  }

    //  catch (Exception err)
    //  {

    //      try
    //      {
    //          sqlTrans.Rollback();
    //      }
    //      catch (Exception ex2)
    //      {
    //          _errmessage = ex2.Message;
    //      }
    //      _errmessage += err.Message;
    //  }

    //  finally
    //  {
    //      sqlConn.Close();
    //      sqlTrans.Dispose();
    //      sqlConn.Dispose();
    //  }

    //  return rowAdded;
    // }



  
}