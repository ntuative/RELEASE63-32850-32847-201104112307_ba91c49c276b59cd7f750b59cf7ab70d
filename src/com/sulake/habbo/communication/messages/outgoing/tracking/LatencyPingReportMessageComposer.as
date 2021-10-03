package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2124:int;
      
      private var var_2125:int;
      
      private var var_2126:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2124 = param1;
         this.var_2125 = param2;
         this.var_2126 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2124,this.var_2125,this.var_2126];
      }
      
      public function dispose() : void
      {
      }
   }
}
