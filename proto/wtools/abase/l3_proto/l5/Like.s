( function _Like_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

}

let _global = _global_;
let _ = _global_.wTools;
var _ObjectHasOwnProperty = Object.hasOwnProperty;
var _nameFielded = _.nameFielded;

_.assert( !_.lconstruction )

//

let Parent = null;
let Self = function wLike( o )
{
}

Self.shortName = 'Like';

// --
// helper
// --

function like()
{
  var helper = new Self();
  var proto = Object.create( null );
  var location;

  Object.defineProperty( proto, 'copy',
  {
    enumerable : false,
    configurable : false,
    writable : false,
    value : function copy( o )
    {
      // debugger;
      _.assert( arguments.length === 1, 'Expects single argument' );
      _.mapExtend( this, o );
      return this;
    }
  });

  Object.defineProperty( proto, 'constructor',
  {
    enumerable : false,
    configurable : false,
    writable : false,
    value : function Construction( o )
    {
      _.assert( arguments.length === 0 || arguments.length === 1, 'lconstruction expects one or none argument' );

      if( !( this instanceof proto.constructor ) )
      if( o instanceof proto.constructor )
      return o;
      else
      return new( _.constructorJoin( proto.constructor, arguments ) );

      _.assertMapHasOnly( this, proto, 'Prototype of the object ' + ( location ? 'defined at\n' + location + '\n' : '' ) + 'does not have requested fields.' );

      _.mapComplement( this, proto );
      Object.preventExtensions( this );

      if( o )
      _.mapExtend( this, o );

      return this;
    }
  });

  var allClasses = [ proto ];
  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var arg = arguments[ a ];
    _.assert( !!arg[ symbolForAllClasses ] );
    if( arg[ symbolForAllClasses ] )
    _.arrayAppendArrayOnce( allClasses, arg[ symbolForAllClasses ] );
  }

  proto.constructor.prototype = proto;

  Object.defineProperty( proto, symbolForParents,
  {
    enumerable : false,
    configurable : false,
    writable : false,
    value : _.longSlice( arguments ),
  });

  Object.defineProperty( proto, symbolForAllClasses,
  {
    enumerable : false,
    configurable : false,
    writable : false,
    value : allClasses,
  });

  Object.defineProperty( proto, symbolForClass,
  {
    enumerable : false,
    configurable : false,
    writable : false,
    value : proto,
  });

  /* */

  helper.proto = proto;
  helper.usingPrototype = false;

  Object.freeze( helper );

  if( arguments.length > 0 )
  _.mapExtend.apply( _, Array.prototype.concat.apply( [ proto ], arguments ) );

  return helper;
}

//

function name( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return this;
}

//

function also( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.mapExtend( this.proto, src );
  return this;
}

//

function but( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.mapDelete( this.proto, src );
  return this;
}

//

function _endGet()
{
  return this.proto;
}

//

function isLike( instance, parent )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( !instance[ symbolForAllClasses ] )
  return false;
  return instance[ symbolForAllClasses ].indexOf( parent ) !== -1;
}

//

function is( instance )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( !instance )
  return false;
  if( !instance.constructor )
  return false;
  if( instance.constructor.name === 'Construction' )
  return true;
}

// --
// var
// --

var symbolForParents = Symbol.for( 'parents' );
var symbolForClass = Symbol.for( 'class' );
var symbolForAllClasses = Symbol.for( 'allClasses' );

// --
// declare
// --

var Proto =
{
  is,
  isLike,
}

_.assert( !_.lconstruction );
_.lconstruction = Object.create( null );
_.mapExtend( _.lconstruction, Proto );

// --
// declare
// --

var Proto =
{
  like,
}

_.mapExtend( _, Proto );

// --
// declare
// --

var Proto =
{
  name,
  also,
  but,
  _endGet,
}

_.classDeclare
({
  cls : Self,
  parent : Parent,
  extend : Proto,
});

_.accessor.readOnly
({
  object : Self.prototype,
  names : { end : {} },
});

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
