use anyhow::Result;

use super::database::Pdb;
impl Pdb {
    pub fn create_tables(&mut self) -> Result<()> {
        self.conn.execute(
            "create table module (
         id integer primary key,
         name text not null ,
         source_file text not null
          
        

     )",
            [],
        )?;

        self.conn.execute(
            "create table variable (
         id integer primary key,
         name text not null ,
         module integer not null,
            type integer, 
            storage_class integer,
            size integer,
            address integer
        

     )",
            [],
        )?;
        self.conn.execute(
            "create table function (
        id integer primary key,
         name text not null,
            module integer not null
     )",
            [],
        )?;
        self.conn.execute(
            "create table source_line (
id integer primary key,
file integer,
line text not null,
line_no integer


)",
            [],
        )?;
        Ok(())
    }
}
