package com.sulake.habbo.communication.messages.outgoing.room.action
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class CallGuideBotMessageComposer implements IMessageComposer
   {
       
      
      public function CallGuideBotMessageComposer()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [];
      }
   }
}
