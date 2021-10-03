package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1414:IID;
      
      private var var_1756:String;
      
      private var var_105:IUnknown;
      
      private var var_751:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1414 = param1;
         this.var_1756 = getQualifiedClassName(this.var_1414);
         this.var_105 = param2;
         this.var_751 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1414;
      }
      
      public function get iis() : String
      {
         return this.var_1756;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_105;
      }
      
      public function get references() : uint
      {
         return this.var_751;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_105 == null;
      }
      
      public function dispose() : void
      {
         this.var_1414 = null;
         this.var_1756 = null;
         this.var_105 = null;
         this.var_751 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_751;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_751) : uint(0);
      }
   }
}
