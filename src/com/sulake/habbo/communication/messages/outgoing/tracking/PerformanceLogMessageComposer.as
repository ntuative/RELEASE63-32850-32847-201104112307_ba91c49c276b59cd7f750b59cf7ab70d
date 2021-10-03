package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2445:int = 0;
      
      private var var_1540:String = "";
      
      private var var_2001:String = "";
      
      private var var_2785:String = "";
      
      private var var_2793:String = "";
      
      private var var_2007:int = 0;
      
      private var var_2792:int = 0;
      
      private var var_2795:int = 0;
      
      private var var_1541:int = 0;
      
      private var var_2794:int = 0;
      
      private var var_1539:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2445 = param1;
         this.var_1540 = param2;
         this.var_2001 = param3;
         this.var_2785 = param4;
         this.var_2793 = param5;
         if(param6)
         {
            this.var_2007 = 1;
         }
         else
         {
            this.var_2007 = 0;
         }
         this.var_2792 = param7;
         this.var_2795 = param8;
         this.var_1541 = param9;
         this.var_2794 = param10;
         this.var_1539 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2445,this.var_1540,this.var_2001,this.var_2785,this.var_2793,this.var_2007,this.var_2792,this.var_2795,this.var_1541,this.var_2794,this.var_1539];
      }
   }
}
