package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1421:int;
      
      private var var_2845:int;
      
      private var var_646:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1421 = param1.readInteger();
         this.var_2845 = param1.readInteger();
         this.var_646 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_646.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get prizeLevelId() : int
      {
         return this.var_1421;
      }
      
      public function get probabilityDenominator() : int
      {
         return this.var_2845;
      }
      
      public function get prizes() : Array
      {
         return this.var_646;
      }
   }
}
