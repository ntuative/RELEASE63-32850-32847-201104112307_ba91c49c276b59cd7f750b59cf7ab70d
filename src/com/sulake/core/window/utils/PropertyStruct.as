package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_157:String = "hex";
      
      public static const const_43:String = "int";
      
      public static const const_258:String = "uint";
      
      public static const const_115:String = "Number";
      
      public static const const_40:String = "Boolean";
      
      public static const const_53:String = "String";
      
      public static const const_225:String = "Point";
      
      public static const const_224:String = "Rectangle";
      
      public static const const_150:String = "Array";
      
      public static const const_247:String = "Map";
       
      
      private var var_591:String;
      
      private var var_176:Object;
      
      private var _type:String;
      
      private var var_2208:Boolean;
      
      private var var_2896:Boolean;
      
      private var var_2207:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_591 = param1;
         this.var_176 = param2;
         this._type = param3;
         this.var_2208 = param4;
         this.var_2896 = param3 == const_247 || param3 == const_150 || param3 == const_225 || param3 == const_224;
         this.var_2207 = param5;
      }
      
      public function get key() : String
      {
         return this.var_591;
      }
      
      public function get value() : Object
      {
         return this.var_176;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2208;
      }
      
      public function get range() : Array
      {
         return this.var_2207;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_157:
               return "0x" + uint(this.var_176).toString(16);
            case const_40:
               return Boolean(this.var_176) == true ? "true" : "OfficialRoomListCtrl";
            case const_225:
               return "Point(" + Point(this.var_176).x + ", " + Point(this.var_176).y + ")";
            case const_224:
               return "Rectangle(" + Rectangle(this.var_176).x + ", " + Rectangle(this.var_176).y + ", " + Rectangle(this.var_176).width + ", " + Rectangle(this.var_176).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_247:
               _loc3_ = this.var_176 as Map;
               _loc1_ = "<var key=\"" + this.var_591 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_150:
               _loc4_ = this.var_176 as Array;
               _loc1_ = "<var key=\"" + this.var_591 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_225:
               _loc5_ = this.var_176 as Point;
               _loc1_ = "<var key=\"" + this.var_591 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_224:
               _loc6_ = this.var_176 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_591 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_157:
               _loc1_ = "<var key=\"" + this.var_591 + "\" value=\"" + "0x" + uint(this.var_176).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_591 + "\" value=\"" + this.var_176 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
