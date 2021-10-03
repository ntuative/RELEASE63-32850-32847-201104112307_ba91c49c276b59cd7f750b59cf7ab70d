package com.sulake.habbo.communication.messages.outgoing.help
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetFaqCategoryMessageComposer implements IMessageComposer
   {
       
      
      private var var_1442:int;
      
      public function GetFaqCategoryMessageComposer(param1:int)
      {
         super();
         this.var_1442 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1442];
      }
      
      public function dispose() : void
      {
      }
   }
}
