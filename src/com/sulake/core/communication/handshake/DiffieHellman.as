package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1016:BigInteger;
      
      private var var_2657:BigInteger;
      
      private var var_1991:BigInteger;
      
      private var var_2772:BigInteger;
      
      private var var_1532:BigInteger;
      
      private var var_1992:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1532 = param1;
         this.var_1992 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1532.toString() + ",generator: " + this.var_1992.toString() + ",secret: " + param1);
         this.var_1016 = new BigInteger();
         this.var_1016.fromRadix(param1,param2);
         this.var_2657 = this.var_1992.modPow(this.var_1016,this.var_1532);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1991 = new BigInteger();
         this.var_1991.fromRadix(param1,param2);
         this.var_2772 = this.var_1991.modPow(this.var_1016,this.var_1532);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2657.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2772.toRadix(param1);
      }
   }
}
