( function _Proto_s_() {

'use strict';

/**
 * Relations module. Collection of routines to define classes and relations between them. Proto leverages multiple inheritances, mixins, accessors, fields groups defining, introspection and more. Use it as a skeleton of the application.
  @module Tools/base/Proto
*/

/**
 * Collection of routines to define classes and relations between them.
 * @namespace Tools( module::Proto )
 * @augments wTools
 * @memberof module:Tools/base/Proto
 */

/**
* Definitions :

*  self :: current object.
*  Self :: current class.
*  Parent :: parent class.
*  Statics :: static fields.
*  extend :: extend destination with all properties from source.
*  supplement :: supplement destination with those properties from source which do not belong to source.

*  routine :: arithmetical, logical and other manipulations on input data, context and globals to get output data.
*  function :: routine which does not have side effects and don't use globals or context.
*  procedure :: routine which use globals, possibly modify global's states.
*  method :: routine which has context, possibly modify context's states.

* Synonym :

  A composes B
    :: A consists of B.s
    :: A comprises B.
    :: A made up of B.
    :: A exists because of B, and B exists because of A.
    :: A складається із B.
  A aggregates B
    :: A has B.
    :: A exists because of B, but B exists without A.
    :: A має B.
  A associates B
    :: A has link on B
    :: A is linked with B
    :: A посилається на B.
  A restricts B
    :: A use B.
    :: A has occasional relation with B.
    :: A використовує B.
    :: A має обмежений, не чіткий, тимчасовий звязок із B.

*/

// if( typeof module !== 'undefined' )
// {
//
//   let _ = require( '../../Tools.s' );
//
//   // if( !_global_.wTools.nameFielded )
//   // try
//   // {
//   //   require( './NameTools.s' );
//   // }
//   // catch( err )
//   // {
//   // }
//
// }

let Self = _global_.wTools;
let _global = _global_;
let _ = _global_.wTools;

let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _ObjectPropertyIsEumerable = Object.propertyIsEnumerable;
let _nameFielded = _.nameFielded;

_.assert( _.objectIs( _.field ), 'wProto needs Tools/dwtools/abase/l1/FieldMapper.s' );
_.assert( _.routineIs( _nameFielded ), 'wProto needs Tools/dwtools/l3/NameTools.s' );

// // --
// // mixin
// // --
//
// /**
//  * Make mixin which could be mixed into prototype of another object.
//  * @param {object} o - options.
//  * @function _mixinDelcare
//  * @memberof module:Tools/base/Proto.Tools( module::Proto )
//  */
//
// function _mixinDelcare( o )
// {
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.mapIs( o ) || _.routineIs( o ) );
//   _.assert( _.routineIs( o.onMixinApply ) || o.onMixinApply === undefined || o.onMixinApply === null, 'Expects routine {-o.onMixinApply-}, but got', _.strType( o ) );
//   _.assert( _.strDefined( o.name ), 'mixin should have name' );
//   _.assert( _.objectIs( o.extend ) || o.extend === undefined || o.extend === null );
//   _.assert( _.objectIs( o.supplementOwn ) || o.supplementOwn === undefined || o.supplementOwn === null );
//   _.assert( _.objectIs( o.supplement ) || o.supplement === undefined || o.supplement === null );
//   _.assertOwnNoConstructor( o );
//   _.routineOptions( _mixinDelcare, o );
//
//   o.mixin = function mixin( dstClass )
//   {
//     let md = this.__mixin__;
//
//     _.assert( arguments.length === 1, 'Expects single argument' );
//     _.assert( _.routineIs( dstClass ), 'Expects constructor' );
//     _.assert( dstClass === dstClass.prototype.constructor );
//     _.assertMapHasOnly( this, [ _.KnownConstructorFields, { mixin : 'mixin', __mixin__ : '__mixin__' }, this.prototype.Statics || {} ] );
//
//     if( md.onMixinApply )
//     md.onMixinApply( md, dstClass );
//     else
//     _.mixinApply( md, dstClass.prototype );
//     if( md.onMixinEnd )
//     md.onMixinEnd( md, dstClass );
//
//     return dstClass;
//   }
//
//   /* */
//
//   if( !o.prototype )
//   {
//     let got = _._classConstructorAndPrototypeGet( o );
//
//     if( got.prototype )
//     o.prototype = got.prototype;
//     else
//     o.prototype = Object.create( null );
//
//     _.classExtend
//     ({
//       cls : got.cls || null,
//       prototype : o.prototype,
//       extend : o.extend || null,
//       supplementOwn : o.supplementOwn || null,
//       supplement : o.supplement || null,
//     });
//
//   }
//
//   _.assert( !o.prototype.mixin, 'not tested' );
//   o.prototype.mixin = o.mixin;
//   if( o.prototype.constructor )
//   {
//     _.assert( !o.prototype.constructor.mixin || o.prototype.constructor.mixin === o.mixin, 'not tested' );
//     o.prototype.constructor.mixin = o.mixin;
//   }
//
//   Object.freeze( o );
//   return o;
// }
//
// _mixinDelcare.defaults =
// {
//
//   name : null,
//   shortName : null,
//   prototype : null,
//
//   extend : null,
//   supplementOwn : null,
//   supplement : null,
//   functors : null,
//
//   onMixinApply : null,
//   onMixinEnd : null,
//
// }
//
// //
//
// function mixinDelcare( o )
// {
//   let result = Object.create( null );
//
//   _.assert( o.mixin === undefined );
//
//   let md = result.__mixin__ = _._mixinDelcare.apply( this, arguments );
//   result.name = md.name;
//   result.shortName = md.shortName;
//   result.prototype = md.prototype;
//   result.mixin = md.mixin;
//
//   Object.freeze( result );
//   return result;
// }
//
// mixinDelcare.defaults = Object.create( _mixinDelcare.defaults );
//
// //
//
// /**
//  * Mixin methods and fields into prototype of another object.
//  * @param {object} o - options.
//  * @function mixinApply
//  * @memberof module:Tools/base/Proto.Tools( module::Proto )
//  */
//
// let MixinDescriptorFields =
// {
//
//   name : null,
//   shortName : null,
//   prototype : null,
//
//   extend : null,
//   supplementOwn : null,
//   supplement : null,
//   functors : null,
//
//   onMixinApply : null,
//   onMixinEnd : null,
//   mixin : null,
//
// }
//
// function mixinApply( mixinDescriptor, dstPrototype )
// {
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.objectIs( dstPrototype ), () => 'Second argument {-dstPrototype-} does not look like prototype, got ' + _.strType( dstPrototype ) );
//   _.assert( _.routineIs( mixinDescriptor.mixin ), 'First argument does not look like mixin descriptor' );
//   _.assert( _.objectIs( mixinDescriptor ) );
//   _.assert( Object.isFrozen( mixinDescriptor ), 'First argument does not look like mixin descriptor' );
//   _.assertMapHasOnly( mixinDescriptor, MixinDescriptorFields );
//
//   /* mixin into routine */
//
//   if( !_.mapIs( dstPrototype ) )
//   {
//     _.assert( dstPrototype.constructor.prototype === dstPrototype, 'mixin :', 'Expects prototype with own constructor field' );
//     _.assert( dstPrototype.constructor.name.length || dstPrototype.constructor._name.length, 'mixin :', 'constructor should has name' );
//     _.assert( _.routineIs( dstPrototype.init ) );
//   }
//
//   /* extend */
//
//   _.assert( _.mapOwnKey( dstPrototype, 'constructor' ) );
//   _.assert( dstPrototype.constructor.prototype === dstPrototype );
//   _.classExtend
//   ({
//     cls : dstPrototype.constructor,
//     extend : mixinDescriptor.extend,
//     supplementOwn : mixinDescriptor.supplementOwn,
//     supplement : mixinDescriptor.supplement,
//     functors : mixinDescriptor.functors,
//   });
//
//   /* mixins map */
//
//   if( !_ObjectHasOwnProperty.call( dstPrototype, '_mixinsMap' ) )
//   {
//     dstPrototype._mixinsMap = Object.create( dstPrototype._mixinsMap || null );
//     _.propertyHide( dstPrototype, '_mixinsMap' );
//   }
//
//   _.assert
//   (
//     !dstPrototype._mixinsMap[ mixinDescriptor.name ],
//       'Attempt to mixin same mixin ' + _.strQuote( mixinDescriptor.name ) +
//       ' several times into ' + _.strQuote( dstPrototype.constructor.name )
//   );
//
//   dstPrototype._mixinsMap[ mixinDescriptor.name ] = 1;
// }
//
// //
//
// function mixinHas( proto, mixin )
// {
//   if( _.constructorIs( proto ) )
//   proto = _.prototypeOf( proto );
//
//   _.assert( _.prototypeIsStandard( proto ) );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( _.strIs( mixin ) )
//   {
//     return proto._mixinsMap && proto._mixinsMap[ mixin ];
//   }
//   else
//   {
//     _.assert( _.routineIs( mixin.mixin ), 'Expects mixin, but got not mixin', _.strType( mixin ) );
//     _.assert( _.strDefined( mixin.name ), 'Expects mixin, but got not mixin', _.strType( mixin ) );
//     return proto._mixinsMap && proto._mixinsMap[ mixin.name ];
//   }
//
// }
//
// // --
// // class
// // --
//
// /**
// * @typedef {object} wTools~prototypeOptions
// * @property {routine} [o.cls=null] - constructor for which prototype is needed.
// * @property {routine} [o.parent=null] - constructor of parent class.
// * @property {object} [o.extend=null] - extend prototype by this map.
// * @property {object} [o.supplement=null] - supplement prototype by this map.
// * @property {object} [o.static=null] - static fields of a class.
// * @property {boolean} [o.usingPrimitiveExtension=false] - extends class with primitive fields from relationship descriptors.
// * @property {boolean} [o.usingOriginalPrototype=false] - makes prototype using original constructor prototype.
// */
//
// /**
//  * Make prototype for constructor repairing relationship : Composes, Aggregates, Associates, Medials, Restricts.
//  * Execute optional extend / supplement if such o present.
//  * @param {wTools~prototypeOptions} o - options {@link wTools~prototypeOptions}.
//  * @returns {object} Returns constructor's prototype based on( o.parent ) prototype and complemented by fields, static and non-static methods.
//  *
//  * @example
//  *  let Parent = function Alpha(){ };
//  *  Parent.prototype.init = function(  )
//  *  {
//  *    let self = this;
//  *    self.c = 5;
//  *  };
//  *
//  *  let Self = function Betta( o )
//  *  {
//  *    return Self.prototype.init.apply( this, arguments );
//  *  }
//  *
//  *  function init()
//  *  {
//  *    let self = this;
//  *    Parent.prototype.init.call( this );
//  *    _.mapExtendConditional( _.field.mapper.srcOwn, self, Composes );
//  *  }
//  *
//  *  let Composes =
//  *  {
//  *   a : 1,
//  *   b : 2,
//  *  }
//  *
//  *  let Proto =
//  *  {
//  *   init,
//  *   Composes
//  *  }
//  *
//  *  _.classDeclare
//  *  ({
//  *    cls : Self,
//  *    parent : Parent,
//  *    extend : Proto,
//  *  });
//  *
//  *  let betta = new Betta();
//  *  console.log( proto === Self.prototype ); //returns true
//  *  console.log( Parent.prototype.isPrototypeOf( betta ) ); //returns true
//  *  console.log( betta.a, betta.b, betta.c ); //returns 1 2 5
//  *
//  * @function classDeclare
//  * @throws {exception} If no argument provided.
//  * @throws {exception} If( o ) is not a Object.
//  * @throws {exception} If( o.cls ) is not a Routine.
//  * @throws {exception} If( o.cls.name ) is not defined.
//  * @throws {exception} If( o.cls.prototype ) has not own constructor.
//  * @throws {exception} If( o.cls.prototype ) has restricted properties.
//  * @throws {exception} If( o.parent ) is not a Routine.
//  * @throws {exception} If( o.extend ) is not a Object.
//  * @throws {exception} If( o.supplement ) is not a Object.
//  * @throws {exception} If( o.parent ) is equal to( o.extend ).
//  * @throws {exception} If function cant rewrite constructor using original prototype.
//  * @throws {exception} If( o.usingOriginalPrototype ) is false and ( o.cls.prototype ) has manually defined properties.
//  * @throws {exception} If( o.cls.prototype.constructor ) is not equal( o.cls  ).
//  * @memberof module:Tools/base/Proto.Tools( module::Proto )
//  */
//
// /*
// _.classDeclare
// ({
//   cls : Self,
//   parent : Parent,
//   extend : Proto,
// });
// */
//
// function classDeclare( o )
// {
//   let result;
//
//   if( o.withClass === undefined )
//   o.withClass = true;
//
//   if( o.cls && !o.name )
//   o.name = o.cls.name;
//
//   if( o.cls && !o.shortName )
//   o.shortName = o.cls.shortName;
//
//   /* */
//
//   let has = {}
//   has.constructor = 'constructor';
//
//   let hasNot =
//   {
//     Parent : 'Parent',
//     Self : 'Self',
//   }
//
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.objectIs( o ) );
//   _.assertOwnNoConstructor( o, 'options for classDeclare should have no constructor' );
//   _.assert( !( 'parent' in o ) || o.parent !== undefined, 'parent is "undefined", something is wrong' );
//
//   if( o.withClass )
//   {
//
//     _.assert( _.routineIs( o.cls ), 'Expects {-o.cls-}' );
//     _.assert( _.routineIs( o.cls ), 'classDeclare expects constructor' );
//     _.assert( _.strIs( o.cls.name ) || _.strIs( o.cls._name ), 'constructor should have name' );
//     _.assert( _ObjectHasOwnProperty.call( o.cls.prototype, 'constructor' ) );
//     _.assert( !o.name || o.cls.name === o.name || o.cls._name === o.name, 'class has name', o.cls.name + ', but options', o.name );
//     _.assert( !o.shortName || !o.cls.shortName|| o.cls.shortName === o.shortName, 'class has short name', o.cls.shortName + ', but options', o.shortName );
//
//     _.assertMapOwnAll( o.cls.prototype, has, 'classDeclare expects constructor' );
//     _.assertMapOwnNone( o.cls.prototype, hasNot );
//     _.assertMapOwnNone( o.cls.prototype, _.DefaultForbiddenNames );
//
//     if( o.extend && _ObjectHasOwnProperty.call( o.extend, 'constructor' ) )
//     _.assert( o.extend.constructor === o.cls );
//
//   }
//   else
//   {
//     _.assert( !o.cls );
//   }
//
//   _.assert( _.routineIs( o.parent ) || o.parent === undefined || o.parent === null, () => 'Wrong type of parent : ' + _.strType( 'o.parent' ) );
//   _.assert( _.objectIs( o.extend ) || o.extend === undefined );
//   _.assert( _.objectIs( o.supplement ) || o.supplement === undefined );
//   _.assert( o.parent !== o.extend || o.extend === undefined );
//
//   if( o.extend )
//   {
//     _.assert( o.extend.cls === undefined );
//     _.assertOwnNoConstructor( o.extend );
//   }
//   if( o.supplementOwn )
//   {
//     _.assert( o.supplementOwn.cls === undefined );
//     _.assertOwnNoConstructor( o.supplementOwn );
//   }
//   if( o.supplement )
//   {
//     _.assert( o.supplement.cls === undefined );
//     _.assertOwnNoConstructor( o.supplement );
//   }
//
//   _.routineOptions( classDeclare, o );
//
//   /* */
//
//   let prototype;
//   if( !o.parent )
//   o.parent = null;
//
//   /* make prototype */
//
//   if( o.withClass )
//   {
//
//     if( o.usingOriginalPrototype )
//     {
//
//       prototype = o.cls.prototype;
//       _.assert( o.parent === null || o.parent === Object.getPrototypeOf( o.cls.prototype ) );
//
//     }
//     else
//     {
//       if( o.cls.prototype )
//       {
//         _.assert( Object.keys( o.cls.prototype ).length === 0, 'misuse of classDeclare, prototype of constructor has properties which where put there manually', Object.keys( o.cls.prototype ) );
//         _.assert( o.cls.prototype.constructor === o.cls );
//       }
//       if( o.parent )
//       {
//         prototype = o.cls.prototype = Object.create( o.parent.prototype );
//       }
//       else
//       {
//         prototype = o.cls.prototype = Object.create( null );
//       }
//     }
//
//     /* constructor */
//
//     prototype.constructor = o.cls;
//
//     if( o.parent )
//     {
//       Object.setPrototypeOf( o.cls, o.parent );
//     }
//
//     /* extend */
//
//     _.classExtend
//     ({
//       cls : o.cls,
//       extend : o.extend,
//       supplementOwn : o.supplementOwn,
//       supplement : o.supplement,
//       usingPrimitiveExtension : o.usingPrimitiveExtension,
//       usingStatics : 1,
//       allowingExtendStatics : o.allowingExtendStatics,
//     });
//
//     /* statics */
//
//     _.assert( _.routineIs( prototype.constructor ) );
//     _.assert( _.objectIs( prototype.Statics ) );
//     _.assertMapHasAll( prototype.constructor, prototype.Statics );
//     _.assert( prototype === o.cls.prototype );
//     _.assert( _ObjectHasOwnProperty.call( prototype, 'constructor' ), 'prototype should has own constructor' );
//     _.assert( _.routineIs( prototype.constructor ), 'prototype should has own constructor' );
//
//     /* mixin tracking */
//
//     if( !_ObjectHasOwnProperty.call( prototype, '_mixinsMap' ) )
//     {
//       prototype._mixinsMap = Object.create( prototype._mixinsMap || null );
//     }
//
//     _.assert( !prototype._mixinsMap[ o.cls.name ] );
//
//     prototype._mixinsMap[ o.cls.name ] = 1;
//
//     result = o.cls;
//
//     /* handler */
//
//     if( prototype.OnClassMakeEnd_meta )
//     prototype.OnClassMakeEnd_meta.call( prototype, o );
//
//     if( o.onClassMakeEnd )
//     o.onClassMakeEnd.call( prototype, o );
//
//   }
//
//   /* */
//
//   if( o.withMixin )
//   {
//
//     let mixinOptions = _.mapExtend( null, o );
//
//     _.assert( !o.usingPrimitiveExtension );
//     _.assert( !o.usingOriginalPrototype );
//     _.assert( !o.parent );
//     _.assert( !o.cls || o.withClass );
//
//     delete mixinOptions.parent;
//     delete mixinOptions.cls;
//     delete mixinOptions.withMixin;
//     delete mixinOptions.withClass;
//     delete mixinOptions.usingPrimitiveExtension;
//     delete mixinOptions.usingOriginalPrototype;
//     delete mixinOptions.allowingExtendStatics;
//     delete mixinOptions.onClassMakeEnd;
//
//     if( mixinOptions.extend )
//     mixinOptions.extend = _.mapExtend( null, mixinOptions.extend );
//     if( mixinOptions.supplement )
//     mixinOptions.supplement = _.mapExtend( null, mixinOptions.supplement );
//     if( mixinOptions.supplementOwn )
//     mixinOptions.supplementOwn = _.mapExtend( null, mixinOptions.supplementOwn );
//
//     mixinOptions.prototype = prototype; /* xxx : remove? */
//
//     _._mixinDelcare( mixinOptions );
//     o.cls.__mixin__ = mixinOptions;
//     o.cls.mixin = mixinOptions.mixin;
//
//     _.assert( mixinOptions.extend === null || mixinOptions.extend.constructor === undefined );
//     _.assert( mixinOptions.supplement === null || mixinOptions.supplement.constructor === undefined );
//     _.assert( mixinOptions.supplementOwn === null || mixinOptions.supplementOwn.constructor === undefined );
//
//   }
//
//   /* */
//
//   if( Config.debug )
//   if( prototype )
//   {
//     let descriptor = Object.getOwnPropertyDescriptor( prototype, 'constructor' );
//     _.assert( descriptor.writable || descriptor.set );
//     _.assert( descriptor.configurable );
//   }
//
//   return result;
// }
//
// classDeclare.defaults =
// {
//   cls : null,
//   parent : null,
//
//   onClassMakeEnd : null,
//   onMixinApply : null,
//   onMixinEnd : null,
//
//   extend : null,
//   supplementOwn : null,
//   supplement : null,
//   functors : null,
//
//   name : null,
//   shortName : null,
//
//   usingPrimitiveExtension : false,
//   usingOriginalPrototype : false,
//   allowingExtendStatics : false,
//
//   withMixin : false,
//   withClass : true,
//
// }
//
// //
//
// /**
//  * Extends and supplements( o.cls ) prototype by fields and methods repairing relationship : Composes, Aggregates, Associates, Medials, Restricts.
//  *
//  * @param {wTools~prototypeOptions} o - options {@link wTools~prototypeOptions}.
//  * @returns {object} Returns constructor's prototype complemented by fields, static and non-static methods.
//  *
//  * @example
//  * let Self = function Betta( o ) { };
//  * let Statics = { staticFunction : function staticFunction(){ } };
//  * let Composes = { a : 1, b : 2 };
//  * let Proto = { Composes, Statics };
//  *
//  * let proto =  _.classExtend
//  * ({
//  *     cls : Self,
//  *     extend : Proto,
//  * });
//  * console.log( Self.prototype === proto ); //returns true
//  *
//  * @function classExtend
//  * @throws {exception} If no argument provided.
//  * @throws {exception} If( o ) is not a Object.
//  * @throws {exception} If( o.cls ) is not a Routine.
//  * @throws {exception} If( prototype.cls ) is not a Routine.
//  * @throws {exception} If( o.cls.name ) is not defined.
//  * @throws {exception} If( o.cls.prototype ) has not own constructor.
//  * @throws {exception} If( o.parent ) is not a Routine.
//  * @throws {exception} If( o.extend ) is not a Object.
//  * @throws {exception} If( o.supplement ) is not a Object.
//  * @throws {exception} If( o.static) is not a Object.
//  * @throws {exception} If( o.cls.prototype.Constitutes ) is defined.
//  * @throws {exception} If( o.cls.prototype ) is not equal( prototype ).
//  * @memberof module:Tools/base/Proto.Tools( module::Proto )
//  */
//
// function classExtend( o )
// {
//
//   if( arguments.length === 2 )
//   o = { cls : arguments[ 0 ], extend : arguments[ 1 ] };
//
//   if( !o.prototype )
//   o.prototype = o.cls.prototype;
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.objectIs( o ) );
//   _.assert( !_ObjectHasOwnProperty.call( o, 'constructor' ) );
//   _.assertOwnNoConstructor( o );
//   _.assert( _.objectIs( o.extend ) || o.extend === undefined || o.extend === null );
//   _.assert( _.objectIs( o.supplementOwn ) || o.supplementOwn === undefined || o.supplementOwn === null );
//   _.assert( _.objectIs( o.supplement ) || o.supplement === undefined || o.supplement === null );
//   _.assert( _.routineIs( o.cls ) || _.objectIs( o.prototype ), 'Expects class constructor or class prototype' );
//
//   /*
//   mixin could have none class constructor
//   */
//
//   if( o.cls )
//   {
//
//     _.assert( _.routineIs( o.cls ), 'Expects constructor of class ( o.cls )' );
//     _.assert( _.strIs( o.cls.name ) || _.strIs( o.cls._name ), 'Class constructor should have name' );
//     _.assert( !!o.prototype );
//
//   }
//
//   if( o.extend )
//   {
//     _.assert( o.extend.cls === undefined );
//     _.assertOwnNoConstructor( o.extend );
//   }
//   if( o.supplementOwn )
//   {
//     _.assert( o.supplementOwn.cls === undefined );
//     _.assertOwnNoConstructor( o.supplementOwn );
//   }
//   if( o.supplement )
//   {
//     _.assert( o.supplement.cls === undefined );
//     _.assertOwnNoConstructor( o.supplement );
//   }
//
//   _.routineOptions( classExtend, o );
//
//   _.assert( _.objectIs( o.prototype ) );
//
//   /* fields groups */
//
//   _.workpiece.fieldsGroupsDeclareForEachFilter
//   ({
//     dstPrototype : o.prototype,
//     extendMap : o.extend,
//     supplementOwnMap : o.supplementOwn,
//     supplementMap : o.supplement,
//   });
//
//   /* get constructor */
//
//   if( !o.cls )
//   o.cls = _._classConstructorAndPrototypeGet( o ).cls;
//
//   /* */
//
//   let staticsOwn = _.mapOwnProperties( o.prototype.Statics );
//   let staticsAll = staticsAllGet();
//   let fieldsGroups = _.workpiece.fieldsGroupsGet( o.prototype );
//
//   /* xxx : investigate */
//   // if( _.mapKeys( staticsOwn ).length )
//   // debugger;
//
// /*
//
// to prioritize ordinary facets adjustment order should be
//
// - static extend
// - ordinary extend
// - ordinary supplement
// - static supplement
//
// */
//
//   /* static extend */
//
//   if( o.extend && o.extend.Statics )
//   declareStaticsForMixin( o.extend.Statics, _.mapExtend );
//
//   /* ordinary extend */
//
//   if( o.extend )
//   fieldsDeclare( _.mapExtend, o.extend );
//
//   /* ordinary supplementOwn */
//
//   if( o.supplementOwn )
//   fieldsDeclare( _.mapSupplementOwn, o.supplementOwn );
//
//   /* ordinary supplement */
//
//   if( o.supplement )
//   fieldsDeclare( _.mapSupplement, o.supplement );
//
//   /* static supplementOwn */
//
//   if( o.supplementOwn && o.supplementOwn.Statics )
//   declareStaticsForMixin( o.supplementOwn.Statics, _.mapSupplementOwn );
//
//   /* static supplement */
//
//   if( o.supplement && o.supplement.Statics )
//   declareStaticsForMixin( o.supplement.Statics, _.mapSupplement );
//
//   /* primitive extend */
//
//   if( o.usingPrimitiveExtension )
//   {
//     debugger;
//     for( let f in _.DefaultFieldsGroupsRelations )
//     if( f !== 'Statics' )
//     if( _.mapOwnKey( o.prototype, f ) )
//     _.mapExtendConditional( _.field.mapper.srcOwnPrimitive, o.prototype, o.prototype[ f ] );
//   }
//
//   /* accessors */
//
//   if( o.supplement )
//   declareAccessors( o.supplement );
//   if( o.supplementOwn )
//   declareAccessors( o.supplementOwn );
//   if( o.extend )
//   declareAccessors( o.extend );
//
//   /* statics */
//
//   let fieldsOfRelationsGroups = _.workpiece.fieldsOfRelationsGroupsFromPrototype( o.prototype );
//
//   if( o.supplement && o.supplement.Statics )
//   declareStaticsForClass( o.supplement.Statics, 0, 0 );
//   if( o.supplementOwn && o.supplementOwn.Statics )
//   declareStaticsForClass( o.supplementOwn.Statics, 0, 1 );
//   if( o.extend && o.extend.Statics )
//   declareStaticsForClass( o.extend.Statics, 1, 1 );
//
//   /* functors */
//
//   if( o.functors )
//   for( let m in o.functors )
//   {
//     let func = o.functors[ m ].call( o, o.prototype[ m ] );
//     _.assert( _.routineIs( func ), 'not tested' );
//     o.prototype[ m ] = func;
//   }
//
//   /* validation */
//
//   /*
//   mixin could could have none class constructor
//   */
//
//   if( o.cls )
//   {
//     _.assert( o.prototype === o.cls.prototype );
//     _.assert( _ObjectHasOwnProperty.call( o.prototype, 'constructor' ), 'prototype should has own constructor' );
//     _.assert( _.routineIs( o.prototype.constructor ), 'prototype should has own constructor' );
//     _.assert( o.cls === o.prototype.constructor );
//   }
//
//   _.assert( _.objectIs( o.prototype.Statics ) );
//
//   return o.prototype;
//
//   /* */
//
//   function fieldsDeclare( extend, src )
//   {
//     let map = _.mapBut( src, fieldsGroups );
//
//     for( let s in staticsAll )
//     if( map[ s ] === staticsAll[ s ] )
//     delete map[ s ];
//
//     extend( o.prototype, map );
//
//     if( Config.debug )
//     if( !o.allowingExtendStatics )
//     if( Object.getPrototypeOf( o.prototype.Statics ) )
//     {
//       map = _.mapBut( map, staticsOwn );
//
//       let keys = _.mapKeys( _.mapOnly( map, Object.getPrototypeOf( o.prototype.Statics ) ) );
//       if( keys.length )
//       {
//         _.assert( 0, 'attempt to extend static field', keys );
//       }
//     }
//   }
//
//   /* */
//
//   function declareStaticsForMixin( statics, extend )
//   {
//
//     if( !o.usingStatics )
//     return;
//
//     extend( staticsAll, statics );
//
//     /* is pure mixin */
//     if( o.prototype.constructor )
//     return;
//
//     if( o.usingStatics && statics )
//     {
//       extend( o.prototype, statics );
//       if( o.cls )
//       extend( o.cls, statics );
//     }
//
//   }
//
//   /* */
//
//   function staticsAllGet()
//   {
//     let staticsAll = _.mapExtend( null, o.prototype.Statics );
//     if( o.supplement && o.supplement.Statics )
//     _.mapSupplement( staticsAll, o.supplement.Statics );
//     if( o.supplementOwn && o.supplementOwn.Statics )
//     _.mapSupplementOwn( staticsAll, o.supplementOwn.Statics );
//     if( o.extend && o.extend.Statics )
//     _.mapExtend( staticsAll, o.extend.Statics );
//     return staticsAll;
//   }
//
//   /* */
//
//   function declareStaticsForClass( statics, extending, dstNotOwn )
//   {
//
//     /* is class */
//     if( !o.prototype.constructor )
//     return;
//     if( !o.usingStatics )
//     return;
//
//     for( let s in statics )
//     {
//
//       if( !_ObjectHasOwnProperty.call( o.prototype.Statics, s ) )
//       continue;
//
//       _.staticDeclare
//       ({
//         name : s,
//         value : o.prototype.Statics[ s ],
//         prototype : o.prototype,
//         extending,
//         dstNotOwn,
//         fieldsOfRelationsGroups,
//       });
//
//     }
//
//   }
//
//   /* */
//
//   function declareAccessors( src )
//   {
//     for( let d in _.accessor.DefaultAccessorsMap )
//     if( src[ d ] )
//     {
//       _.accessor.DefaultAccessorsMap[ d ]( o.prototype, src[ d ] );
//     }
//   }
//
// }
//
// classExtend.defaults =
// {
//   cls : null,
//   prototype : null,
//
//   extend : null,
//   supplementOwn : null,
//   supplement : null,
//   functors : null,
//
//   usingStatics : true,
//   usingPrimitiveExtension : false,
//   allowingExtendStatics : false,
// }
//
// //
//
// function staticDeclare( o )
// {
//
//   if( !( 'value' in o ) )
//   o.value = o.prototype.Statics[ o.name ];
//
//   if( _.definitionIs( o.value ) )
//   _.mapExtend( o, o.value.initialValueGet() );
//
//   _.routineOptions( staticDeclare, arguments );
//   _.assert( _.strIs( o.name ) );
//   _.assert( arguments.length === 1 );
//
//   if( !o.fieldsOfRelationsGroups )
//   o.fieldsOfRelationsGroups = _.workpiece.fieldsOfRelationsGroupsFromPrototype( o.prototype );
//
//   let pd = _.propertyDescriptorGet( o.prototype, o.name );
//   let cd = _.propertyDescriptorGet( o.prototype.constructor, o.name );
//
//   if( pd.object !== o.prototype )
//   pd.descriptor = null;
//
//   if( cd.object !== o.prototype.constructor )
//   cd.descriptor = null;
//
//   if( o.name === 'constructor' )
//   return;
//
//   let symbol = Symbol.for( o.name );
//   let aname = _.accessor._propertyGetterSetterNames( o.name );
//   let methods = Object.create( null );
//
//   /* */
//
//   let prototype = o.prototype;
//   if( !o.readOnly )
//   methods[ aname.set ] = function set( src )
//   {
//     /*
//       should assign fields to the original class / prototype
//       not descendant
//     */
//     prototype[ symbol ] = src;
//     prototype.constructor[ symbol] = src;
//   }
//   methods[ aname.get ] = function get()
//   {
//     return this[ symbol ];
//   }
//
//   /* */
//
//   if( o.fieldsOfRelationsGroups[ o.name ] === undefined )
//   if( !pd.descriptor || ( o.extending && pd.descriptor.value === undefined ) )
//   {
//
//     if( cd.descriptor )
//     {
//       o.prototype[ o.name ] = o.value;
//     }
//     else
//     {
//       o.prototype[ symbol ] = o.value;
//
//       _.accessor.declare
//       ({
//         object : o.prototype,
//         methods,
//         names : o.name,
//         combining : 'rewrite',
//         configurable : true,
//         enumerable : false,
//         strict : false,
//         readOnly : o.readOnly,
//       });
//
//     }
//   }
//
//   /* */
//
//   if( !cd.descriptor || ( o.extending && cd.descriptor.value === undefined ) )
//   {
//     if( pd.descriptor )
//     {
//       o.prototype.constructor[ o.name ] = o.value;
//     }
//     else
//     {
//       o.prototype.constructor[ symbol ] = o.value;
//
//       _.accessor.declare
//       ({
//         object : o.prototype.constructor,
//         methods,
//         names : o.name,
//         combining : 'rewrite',
//         enumerable : true,
//         configurable : true,
//         prime : false,
//         strict : false,
//         readOnly : o.readOnly,
//       });
//
//     }
//
//   }
//
//   /* */
//
//   return true;
// }
//
// var defaults = staticDeclare.defaults = Object.create( null );
//
// defaults.name = null;
// defaults.value = null;
// defaults.prototype = null;
// defaults.fieldsOfRelationsGroups = null;
// defaults.extending = 0; /**/
// defaults.dstNotOwn = 0; /* !!! not used */
// defaults.readOnly = 0;
//

//

function constructorIsStandard( cls )
{

  _.assert( _.constructorIs( cls ) );

  let prototype = _.prototypeOf( cls );

  return _.prototypeIsStandard( prototype );
}

//

function constructorOf( src )
{
  let proto;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _ObjectHasOwnProperty.call( src, 'constructor' ) )
  {
    proto = src; /* proto */
  }
  else if( _ObjectHasOwnProperty.call( src, 'prototype' )  )
  {
    if( src.prototype )
    proto = src.prototype; /* constructor */
    else
    proto = Object.getPrototypeOf( Object.getPrototypeOf( src ) ); /* instance behind ruotine */
  }
  else
  {
    proto = Object.getPrototypeOf( src ); /* instance */
  }

  if( proto === null )
  return null;
  else
  return proto.constructor;
}

//

function isSubClassOf( subCls, cls )
{

  _.assert( _.routineIs( cls ) );
  _.assert( _.routineIs( subCls ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( cls === subCls )
  return true;

  return Object.isPrototypeOf.call( cls.prototype, subCls.prototype );
}

//

function isSubPrototypeOf( sub, parent )
{

  _.assert( !!parent );
  _.assert( !!sub );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( parent === sub )
  return true;

  return Object.isPrototypeOf.call( parent, sub );

}

//

/**
 * Get parent's constructor.
 * @function parentOf
 * @memberof wCopyable#
 */

function parentOf( src )
{
  let c = _.constructorOf( src );

  _.assert( arguments.length === 1, 'Expects single argument' );

  let proto = Object.getPrototypeOf( c.prototype );
  let result = proto ? proto.constructor : null;

  return result;
}

//

function _classConstructorAndPrototypeGet( o )
{
  let result = Object.create( null );

  if( !result.cls )
  if( o.prototype )
  result.cls = o.prototype.constructor;

  if( !result.cls )
  if( o.extend )
  if( o.extend.constructor !== Object.prototype.constructor )
  result.cls = o.extend.constructor;

  if( !result.cls )
  if( o.usingStatics && o.extend && o.extend.Statics )
  if( o.extend.Statics.constructor !== Object.prototype.constructor )
  result.cls = o.extend.Statics.constructor;

  if( !result.cls )
  if( o.supplement )
  if( o.supplement.constructor !== Object.prototype.constructor )
  result.cls = o.supplement.constructor;

  if( !result.cls )
  if( o.usingStatics && o.supplement && o.supplement.Statics )
  if( o.supplement.Statics.constructor !== Object.prototype.constructor )
  result.cls = o.supplement.Statics.constructor;

  if( o.prototype )
  result.prototype = o.prototype;
  else if( result.cls )
  result.prototype = result.cls.prototype;

  if( o.prototype )
  _.assert( result.cls === o.prototype.constructor );

  return result;
}

// --
// prototype
// --

function prototypeOf( src )
{
  _.assert( arguments.length === 1, 'Expects single argument, probably you want routine isPrototypeOf' );

  if( !( 'constructor' in src ) )
  return null;

  let c = _.constructorOf( src );

  _.assert( arguments.length === 1, 'Expects single argument' );

  return c.prototype;
}

//

/**
 * Make united interface for several maps. Access to single map cause read and write to original maps.
 * @param {array} protos - maps to united.
 * @return {object} united interface.
 * @function prototypeUnitedInterface
 * @memberof module:Tools/base/Proto.Tools( module::Proto )
 */

function prototypeUnitedInterface( protos )
{
  let result = Object.create( null );
  let unitedArraySymbol = Symbol.for( '_unitedArray_' );
  let unitedMapSymbol = Symbol.for( '_unitedMap_' );
  let protoMap = Object.create( null );

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( protos ) );

  //

  function get( fieldName )
  {
    return function unitedGet()
    {
      return this[ unitedMapSymbol ][ fieldName ][ fieldName ];
    }
  }
  function set( fieldName )
  {
    return function unitedSet( value )
    {
      this[ unitedMapSymbol ][ fieldName ][ fieldName ] = value;
    }
  }

  //

  for( let p = 0 ; p < protos.length ; p++ )
  {
    let proto = protos[ p ];
    for( let f in proto )
    {
      if( f in protoMap )
      throw _.err( 'prototypeUnitedInterface :', 'several objects try to unite have same field :', f );
      protoMap[ f ] = proto;

      let methods = Object.create( null )
      methods[ f + 'Get' ] = get( f );
      methods[ f + 'Set' ] = set( f );
      let names = Object.create( null );
      names[ f ] = f;
      _.accessor.declare
      ({
        object : result,
        names,
        methods,
        strict : 0,
        prime : 0,
      });

    }
  }

  /*result[ unitedArraySymbol ] = protos;*/
  result[ unitedMapSymbol ] = protoMap;

  return result;
}

//

/**
 * Append prototype to object. Find archi parent and replace its proto.
 * @param {object} dstMap - dst object to append proto.
 * @function prototypeAppend
 * @memberof module:Tools/base/Proto.Tools( module::Proto )
 */

function prototypeAppend( dstMap )
{

  _.assert( _.objectIs( dstMap ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let proto = arguments[ a ];

    _.assert( _.objectIs( proto ) );

    let parent = _.prototypeArchyGet( dstMap );
    Object.setPrototypeOf( parent, proto );

  }

  return dstMap;
}

//

/**
 * Does srcProto has insProto as prototype.
 * @param {object} srcProto - proto stack to investigate.
 * @param {object} insProto - proto to look for.
 * @function prototypeHasPrototype
 * @memberof module:Tools/base/Proto.Tools( module::Proto )
 */

function prototypeHasPrototype( srcProto, insProto )
{

  while( srcProto !== null )
  {
    if( srcProto === insProto )
    return true;
    srcProto = Object.getPrototypeOf( srcProto );
  }

  // do
  // {
  //   if( srcProto === insProto )
  //   return true;
  //   srcProto = Object.getPrototypeOf( srcProto );
  // }
  // while( srcProto !== Object.prototype && srcProto !== null );

  return false;
}

//

/**
 * Return proto owning names.
 * @param {object} srcPrototype - src object to investigate proto stack.
 * @function prototypeHasProperty
 * @memberof module:Tools/base/Proto.Tools( module::Proto )
 */

function prototypeHasProperty( srcPrototype, names )
{
  names = _nameFielded( names );
  _.assert( _.objectIs( srcPrototype ) );

  do
  {
    let has = true;
    for( let n in names )
    if( !_ObjectHasOwnProperty.call( srcPrototype, n ) )
    {
      has = false;
      break;
    }
    if( has )
    return srcPrototype;

    srcPrototype = Object.getPrototypeOf( srcPrototype );
  }
  while( srcPrototype !== Object.prototype && srcPrototype );

  return null;
}

//

/**
 * Returns parent which has default proto.
 * @param {object} srcPrototype - dst object to append proto.
 * @function prototypeArchyGet
 * @memberof module:Tools/base/Proto.Tools( module::Proto )
 */

function prototypeArchyGet( srcPrototype )
{

  _.assert( _.objectIs( srcPrototype ) );

  while( Object.getPrototypeOf( srcPrototype ) !== Object.prototype )
  srcPrototype = Object.getPrototypeOf( srcPrototype );

  return srcPrototype;
}

//

function prototypeHasField( src, fieldName )
{
  let prototype = _.prototypeOf( src );

  _.assert( _.prototypeIsStandard( prototype ), 'Expects standard prototype' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( fieldName ) );

  for( let f in _.DefaultFieldsGroupsRelations )
  if( prototype[ f ][ fieldName ] !== undefined )
  return true;

  return false;
}

//

/*
_.prototypeCrossRefer
({
  namespace : _,
  entities :
  {
    System : Self,
  },
  names :
  {
    System : 'LiveSystem',
    Node : 'LiveNode',
  },
});
*/

let _protoCrossReferAssociations = Object.create( null );
function prototypeCrossRefer( o )
{
  let names = _.mapKeys( o.entities );
  let length = names.length;

  let association = _protoCrossReferAssociations[ o.name ];
  if( !association )
  {
    _.assert( _protoCrossReferAssociations[ o.name ] === undefined );
    association = _protoCrossReferAssociations[ o.name ] = Object.create( null );
    association.name = o.name;
    association.length = length;
    association.have = 0;
    association.entities = _.mapExtend( null, o.entities );
  }
  else
  {
    _.assert( _.arraySetIdentical( _.mapKeys( association.entities ), _.mapKeys( o.entities ) ), 'cross reference should have same associations' );
  }

  _.assert( association.name === o.name );
  _.assert( association.length === length );

  for( let e in o.entities )
  {
    if( !association.entities[ e ] )
    association.entities[ e ] = o.entities[ e ];
    else if( o.entities[ e ] )
    _.assert( association.entities[ e ] === o.entities[ e ] );
  }

  association.have = 0;
  for( let e in association.entities )
  if( association.entities[ e ] )
  association.have += 1;

  if( association.have === association.length )
  {

    for( let src in association.entities )
    for( let dst in association.entities )
    {
      if( src === dst )
      continue;
      let dstEntity = association.entities[ dst ];
      let srcEntity = association.entities[ src ];
      _.assert( !dstEntity[ src ] || dstEntity[ src ] === srcEntity, 'override of entity', src );
      _.assert( !dstEntity.prototype[ src ] || dstEntity.prototype[ src ] === srcEntity );
      _.classExtend( dstEntity, { Statics : { [ src ] : srcEntity } } );
      _.assert( dstEntity[ src ] === srcEntity );
      _.assert( dstEntity.prototype[ src ] === srcEntity );
    }

    _protoCrossReferAssociations[ o.name ] = null;

    return true;
  }

  return false;
}

prototypeCrossRefer.defaults =
{
  entities : null,
  name : null,
}

//

/**
 * Iterate through prototypes.
 * @param {object} proto - prototype
 * @function prototypeEach
 * @memberof module:Tools/base/Proto.Tools( module::Proto )
 */

function prototypeEach( proto, onEach )
{
  let result = [];

  _.assert( _.routineIs( onEach ) || !onEach );
  _.assert( !_.primitiveIs( proto ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  do
  {

    if( onEach )
    onEach.call( this, proto );

    result.push( proto );

    // let parent = _.parentOf( proto );

    proto = Object.getPrototypeOf( proto );

    // proto = parent ? parent.prototype : null;

    // if( proto && proto.constructor === Object )
    // proto = null;

  }
  while( proto );

  return result;
}

//

function prototypeEach_deprecated( proto, onEach )
{
  let result = [];

  _.assert( _.routineIs( onEach ) || !onEach );
  _.assert( _.objectIs( proto ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );

  do
  {

    if( onEach )
    onEach.call( this, proto );

    result.push( proto );

    let parent = _.parentOf( proto );

    proto = parent ? parent.prototype : null;

    if( proto && proto.constructor === Object )
    proto = null;

  }
  while( proto );

  return result;
}

// --
// instance
// --

function instanceIsStandard( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.instanceIs( src ) )
  return false;

  let proto = _.prototypeOf( src );

  if( !proto )
  return false;

  return _.prototypeIsStandard( proto );
}

// --
// property
// --

function propertyDescriptorActiveGet( object, name )
{
  let result = Object.create( null );
  result.object = null;
  result.descriptor = null;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  do
  {
    let descriptor = Object.getOwnPropertyDescriptor( object, name );
    if( descriptor && !( 'value' in descriptor ) )
    {
      result.descriptor = descriptor;
      result.object = object;
      return result;
    }
    object = Object.getPrototypeOf( object );
  }
  while( object );

  return result;
}

//

function propertyDescriptorGet( object, name )
{
  let result = Object.create( null );
  result.object = null;
  result.descriptor = null;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  do
  {
    let descriptor = Object.getOwnPropertyDescriptor( object, name );
    if( descriptor )
    {
      result.descriptor = descriptor;
      result.object = object;
      return result;
    }
    object = Object.getPrototypeOf( object );
  }
  while( object );

  return result;
}

// --
// field
// --

/**
 * @summary Defines hidden property with name( name ) and value( value ) on target object( dstPrototype ).
 *
 * @description
 * Property is defined as not enumarable.
 * Also accepts second argument as map of properties.
 * If second argument( name ) is a map and third argument( value ) is also defined, then all properties will have value of last arg.
 *
 * @param {Object} dstPrototype - target object
 * @param {String|Object} name - name of property or map of names
 * @param {*} value - destination object
 *
 * @throws {Exception} If number of arguments is not supported.
 * @throws {Exception} If dstPrototype is not an Object
   * @function propertyHide
 *
 * @memberof module:Tools/base/Proto.wTools.accessor
 */

function propertyHide( dstPrototype, name, value )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( !_.primitiveIs( dstPrototype ), () => 'dstPrototype is needed, but got ' + _.toStrShort( dstPrototype ) );

  // if( _.containerIs( name ) )
  // {
  //   _.eachKey( name, ( n, v ) =>
  //   {
  //     if( value !== undefined )
  //     _.propertyHide( dstPrototype, n, value );
  //     else
  //     _.propertyHide( dstPrototype, n, v );
  //   });
  //   return;
  // }

  if( _.containerIs( name ) )
  {
    if( !_.objectIs( name ) )
    debugger;
    if( !_.objectIs( name ) )
    name = _.indexExtending( name, ( e ) => { return { [ e ] : undefined } } );
    _.each( name, ( v, n ) =>
    {
      if( value !== undefined )
      _.propertyHide( dstPrototype, n, value );
      else
      _.propertyHide( dstPrototype, n, v );
    });
    return;
  }

  if( value === undefined )
  value = dstPrototype[ name ];

  _.assert( _.strIs( name ), 'name is needed, but got', name );

  Object.defineProperty( dstPrototype, name,
  {
    value,
    enumerable : false,
    writable : true,
    configurable : true,
  });

}

//

/**
 * Makes constants properties on object by creating new or replacing existing properties.
 * @param {object} dstPrototype - prototype of class which will get new constant property.
 * @param {object} namesObject - name/value map of constants.
 *
 * @example
 * let Self = function ClassName( o ) { };
 * let Constants = { num : 100  };
 * _.propertyConstant( Self.prototype, Constants );
 * console.log( Self.prototype ); // returns { num: 100 }
 * Self.prototype.num = 1;// error assign to read only property
 *
 * @function propertyConstant
 * @throws {exception} If no argument provided.
 * @throws {exception} If( dstPrototype ) is not a Object.
 * @throws {exception} If( name ) is not a Map.
 * @memberof module:Tools/base/Proto.wTools.accessor
 */

function propertyConstant( dstPrototype, name, value )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( !_.primitiveIs( dstPrototype ), () => 'dstPrototype is needed, but got ' + _.toStrShort( dstPrototype ) );

  // if( _.containerIs( name ) )
  // {
  //   _.eachKey( name, ( n, v ) =>
  //   {
  //     if( value !== undefined )
  //     _.propertyConstant( dstPrototype, n, value );
  //     else
  //     _.propertyConstant( dstPrototype, n, v );
  //   });
  //   return;
  // }

  if( _.containerIs( name ) )
  {
    if( !_.objectIs( name ) )
    debugger;
    if( !_.objectIs( name ) )
    name = _.indexExtending( name, ( e ) => { return { [ e ] : undefined } } );
    _.each( name, ( v, n ) =>
    {
      if( value !== undefined )
      _.propertyConstant( dstPrototype, n, value );
      else
      _.propertyConstant( dstPrototype, n, v );
    });
    return;
  }

  if( value === undefined )
  value = dstPrototype[ name ];

  _.assert( _.strIs( name ), 'name is needed, but got', name );

  Object.defineProperty( dstPrototype, name,
  {
    value,
    enumerable : true,
    writable : false,
    configurable : false,
  });

}

// --
// proxy
// --

function proxyNoUndefined( ins )
{

  let validator =
  {
    set : function( obj, k, e )
    {
      if( obj[ k ] === undefined )
      throw _.err( 'Map does not have field', k );
      obj[ k ] = e;
      return true;
    },
    get : function( obj, k )
    {
      if( !_.symbolIs( k ) )
      if( obj[ k ] === undefined )
      throw _.err( 'Map does not have field', k );
      return obj[ k ];
    },

  }

  let result = new Proxy( ins, validator );

  return result;
}

//

function proxyReadOnly( ins )
{

  let validator =
  {
    set : function( obj, k, e )
    {
      throw _.err( 'Read only', _.strType( ins ), ins );
    }
  }

  let result = new Proxy( ins, validator );

  return result;
}

//

function ifDebugProxyReadOnly( ins )
{

  if( !Config.debug )
  return ins;

  return _.proxyReadOnly( ins );
}

//

function proxyMap( dst, original )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !!dst );
  _.assert( !!original );

  let handler =
  {
    get : function( dst, k, proxy )
    {
      if( dst[ k ] !== undefined )
      return dst[ k ];
      return original[ k ];
    },
    set : function( dst, k, val, proxy )
    {
      if( dst[ k ] !== undefined )
      dst[ k ] = val;
      else if( original[ k ] !== undefined )
      original[ k ] = val;
      else
      dst[ k ] = val;
      return true;
    },
  }

  let result = new Proxy( dst, handler );

  return result;
}

// --
// default
// --

/*
apply default to each element of map, if present
*/

function defaultApply( src )
{

  _.assert( _.objectIs( src ) || _.longIs( src ) );

  let defVal = src[ _.def ];

  if( !defVal )
  return src;

  _.assert( _.objectIs( src ) );

  if( _.objectIs( src ) )
  {

    for( let s in src )
    {
      if( !_.objectIs( src[ s ] ) )
      continue;
      _.mapSupplement( src[ s ], defVal );
    }

  }
  else
  {

    for( let s = 0 ; s < src.length ; s++ )
    {
      if( !_.objectIs( src[ s ] ) )
      continue;
      _.mapSupplement( src[ s ], defVal );
    }

  }

  return src;
}

//

/*
activate default proxy
*/

function defaultProxy( map )
{

  _.assert( _.objectIs( map ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let validator =
  {
    set : function( obj, k, e )
    {
      obj[ k ] = _.defaultApply( e );
      return true;
    }
  }

  let result = new Proxy( map, validator );

  for( let k in map )
  {
    _.defaultApply( map[ k ] );
  }

  return result;
}

//

function defaultProxyFlatteningToArray( src )
{
  let result = [];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectIs( src ) || _.arrayIs( src ) );

  function flatten( src )
  {

    if( _.arrayIs( src ) )
    {
      for( let s = 0 ; s < src.length ; s++ )
      flatten( src[ s ] );
    }
    else
    {
      if( _.objectIs( src ) )
      result.push( defaultApply( src ) );
      else
      result.push( src );
    }

  }

  flatten( src );

  return result;
}

// // --
// //
// // --
//
// /**
// * @classdesc Class container for creating property-like entity from non-primitive value.
//   Is used by routines:
//   @see {@link module:Tools/base/Proto.wTools.define.own}
//   @see {@link module:Tools/base/Proto.wTools.define.common}
//   @see {@link module:Tools/base/Proto.wTools.define.instanceOf}
//   @see {@link module:Tools/base/Proto.wTools.define.makeWith}
//   @see {@link module:Tools/base/Proto.wTools.define.contained}
// * @class Definition
// * @memberof module:Tools/base/Proto.wTools.define
// */
//
// function Definition( o )
// {
//   _.assert( arguments.length === 1 );
//   if( !( this instanceof Definition ) )
//   if( o instanceof Definition )
//   return o;
//   else
//   return new( _.constructorJoin( Definition, arguments ) );
//   _.mapExtend( this, o );
//   _.assert( this.ini !== undefined );
//   return this;
// }
//
// //
//
// function field( o )
// {
//   _.assert( _.mapIs( o ) );
//   _.assert( o.ini !== undefined );
//   o = _.routineOptions( field, arguments );
//   _.assert( arguments.length === 1 );
//   _.assert( _.strIs( o.iniToIns ) );
//   _.assert( _.arrayHas( [ 'scalar' , 'array' , 'map' ], o.collection ) );
//   _.assert( 'scalar' === o.collection, 'not implemented' );
//   _.assert( _.arrayHas( [ 'val' , 'shallow' , 'deep' , 'make' , 'construct' ], o.iniToIns ) );
//
//   let definition = new Definition( o );
//
//   if( o.iniToIns === 'val' )
//   {
//     definition.initialValueGet = function get() { return this.ini }
//   }
//   else if( o.iniToIns === 'shallow' )
//   {
//     debugger;
//     definition.initialValueGet = function get() { return _.entityMake( this.ini ) }
//   }
//   else if( o.iniToIns === 'deep' )
//   {
//     debugger;
//     definition.initialValueGet = function get() { return _.cloneJust( this.ini ) }
//   }
//   else if( o.iniToIns === 'make' )
//   {
//     debugger;
//     definition.initialValueGet = function get() { return this.ini() }
//   }
//   else if( o.iniToIns === 'construct' )
//   {
//     debugger;
//     definition.initialValueGet = function get() { return new this.ini() }
//   }
//   else _.assert( 0 );
//
//   // definition.initialValueGet = function get() { return _.entityMake( this.ini ) }
//   // definition.initialValueGet = function get() { return _.cloneJust( this.ini ) }
//
// /*
//   common,
//   own,
//   instanceOf,
//   makeWith,
// */
//
//   Object.freeze( definition );
//   return definition;
// }
//
// field.defaults =
// {
//   order           : 0,
//   static          : 0,
//   enumerable      : 1,
//   configurable    : 1,
//   collection      : 'scalar',
//   insToIns        : 'val',
//   datToIns        : 'val',
//   insToDat        : 'val',
//   datToDat        : 'val',
//   iniToIns        : 'val',
//   ini             : null,
//   relation        : null,
// }
//
// /*
// |                | Composes | Aggregates | Associates  |  Restricts  |  Medials  |   Statics   |
// | -------------- |:--------:|:----------:|:-----------:|:-----------:|:---------:|:-----------:|
// | Static         |          |            |             |             |           |      +      |
// | Ins to Ins     |   deep   |    val     |    val      |      -      |     -     |             |
// | Dat to Ins     |   deep   |    deep    |    val      |      -      |   val     |             |
// | Ins to Dat     |   deep   |    deep    |    val      |      -      |     -     |             |
// | Dat to Dat     |   deep   |    deep    |    val      |      -      |   val     |             |
// */
//
// /*
// order           : [ -10 .. +10 ]                                                                            @default : 0
// static          : [ 0 , 1 ]                                                                                 @default : 0
// enumerable      : [ 0 , 1 ]                                                                                 @default : 1
// configurable    : [ 0 , 1 ]                                                                                 @default : 1
// initialValueGet : routine                                                                                   @default : null
// collection      : [ scalar , array , map ]                                                                  @default : scalar
// insToIns        : [ val , shallow , deep ]                                                                  @default : val
// datToIns        : [ val , shallow , deep ]                                                                  @default : val
// insToDat        : [ val , shallow , deep ]                                                                  @default : val
// datToDat        : [ val , shallow , deep ]                                                                  @default : val
// iniToIns        : [ val , shallow , deep , make , construct ]                                               @default : val
// relation        : [ null , composes , aggregates , associates , restricts , medials , statics , copiers ]   @default : null
// ini             : *                                                                                         @default : null
// */
//
// //
//
// /**
// * Creates property-like entity with getter that returns reference to source object.
// * @param {Object-like|Long} src - source value
// * @returns {module:Tools/base/Proto.wTools.define.Definition}
// * @function common
// * @memberof module:Tools/base/Proto.wTools.define
// */
//
// function common( src )
// {
//   let definition = new Definition({ ini : src });
//
//   _.assert( src !== undefined, () => 'Expects object-like or long, but got ' + _.strType( src ) );
//   _.assert( arguments.length === 1 );
//
//   definition.initialValueGet = function get() { return this.ini }
//
//   _.propertyHide( definition, 'initialValueGet' );
//
//   Object.freeze( definition );
//   return definition;
// }
//
// //
//
// /**
// * Creates property-like entity with getter that returns shallow copy of source object.
// * @param {Object-like|Long} src - source value
// * @returns {module:Tools/base/Proto.wTools.define.Definition}
// * @function own
// * @memberof module:Tools/base/Proto.wTools.define
// */
//
// function own( src )
// {
//   let definition = new Definition({ ini : src });
//
//   _.assert( src !== undefined, () => 'Expects object-like or long, but got ' + _.strType( src ) );
//   _.assert( arguments.length === 1 );
//
//   // definition.initialValueGet = function get() { return _.entityMake( this.ini ) }
//   definition.initialValueGet = function get() { return _.cloneJust( this.ini ) }
//
//   _.propertyHide( definition, 'initialValueGet' );
//
//   Object.freeze( definition );
//   return definition;
// }
//
// //
//
// /**
// * Creates property-like entity with getter that returns new instance of source constructor.
// * @param {Function} src - source constructor
// * @returns {module:Tools/base/Proto.wTools.define.Definition}
// * @function instanceOf
// * @memberof module:Tools/base/Proto.wTools.define
// */
//
// function instanceOf( src )
// {
//   let definition = new Definition({ ini : src });
//
//   _.assert( _.routineIs( src ), 'Expects constructor' );
//   _.assert( arguments.length === 1 );
//
//   definition.initialValueGet = function get() { return new this.ini() }
//
//   _.propertyHide( definition, 'initialValueGet' );
//
//   Object.freeze( definition );
//   return definition;
// }
//
// //
//
// /**
// * Creates property-like entity with getter that returns result of source routine call.
// * @param {Function} src - source routine
// * @returns {module:Tools/base/Proto.wTools.define.Definition}
// * @function makeWith
// * @memberof module:Tools/base/Proto.wTools.define
// */
//
// function makeWith( src )
// {
//   let definition = new Definition({ ini : src });
//
//   _.assert( _.routineIs( src ), 'Expects constructor' );
//   _.assert( arguments.length === 1 );
//
//   definition.initialValueGet = function get() { return this.ini() }
//
//   _.propertyHide( definition, 'initialValueGet' );
//
//   Object.freeze( definition );
//   return definition;
// }
//
// //
//
// /**
// * @param {Object} src
// * @returns {module:Tools/base/Proto.wTools.define.Definition}
// * @function contained
// * @memberof module:Tools/base/Proto.wTools.define
// */
//
// /*
// xxx : remove routine contained
// */
//
// function contained( src )
// {
//
//   _.assert( _.mapIs( src ) );
//   _.assert( arguments.length === 1 );
//   _.assert( src.ini !== undefined );
//
//   let container = _.mapBut( src, contained.defaults );
//   let o = _.mapOnly( src, contained.defaults );
//   o.container = container;
//   o.ini = src.ini;
//   let definition = new Definition( o );
//
//   if( o.shallowCloning )
//   definition.initialValueGet = function get()
//   {
//     let result = this.container;
//     result.value = _.entityMake( definition.ini );
//     return result;
//   }
//   else
//   definition.initialValueGet = function get()
//   {
//     let result = this.container;
//     result.value = definition.ini;
//     return result;
//   }
//
//   _.propertyHide( definition, 'initialValueGet' );
//   Object.freeze( definition );
//   return definition;
// }
//
// contained.defaults =
// {
//   ini : null,
//   shallowCloning : 0,
// }

// --
// type
// --

class wCallableObject extends Function
{
  constructor()
  {
    // debugger;
    super( 'return this.routine.__call__.apply( this.routine, arguments );' );
    let context = Object.create( null );
    let routine = this.bind( context );
    context.routine = routine;
    Object.freeze( context );
    // Object.defineProperty( routine, Symbol.toStringTag,
    // {
    //   get : function() { return 'Callable' },
    //   enumerable : false,
    //   configurable : false,
    // });
    return routine;
  }
  // static shortName = 'CallableObject';
}

wCallableObject.shortName = 'CallableObject';

// class wCallableObject2 extends Function
// {
//   constructor()
//   {
//     debugger;
//     super( 'debugger; return this.itself.__call__.apply( this.itself, arguments );' );
//     let bound = this.bind( this );
//     Object.defineProperty( this, 'itself',
//     {
//       enumerable : false,
//       configurable : false,
//       writable : false,
//       value : this,
//     });
//     return bound;
//     // super( 'return this.routine.__call__.apply( this.routine, arguments );' );
//     // let context = Object.create( null );
//     // let routine = this.bind( context );
//     // context.routine = routine;
//     // Object.freeze( context );
//     // return routine;
//   }
//   static shortName = 'CallableObject';
// }

// wCallableObject.shortName = 'CallableObject';
_.assert( wCallableObject.shortName === 'CallableObject' );

// --
// fields
// --

let Combining = [ 'rewrite', 'supplement', 'apppend', 'prepend' ];

// /**
//  * @typedef {Object} KnownConstructorFields - contains fields allowed for class constructor.
//  * @property {String} name - full name
//  * @property {String} _name - private name
//  * @property {String} shortName - short name
//  * @property {Object} prototype - prototype object
//  * @memberof module:Tools/base/Proto
//  */
//
// let KnownConstructorFields =
// {
//   name : null,
//   _name : null,
//   shortName : null,
//   prototype : null,
// }

/**
 * @typedef {Object} DefaultFieldsGroups - contains predefined class fields groups.
 * @memberof module:Tools/base/Proto
 */

/**
 * @typedef {Object} DefaultFieldsGroupsRelations - contains predefined class relationship types.
 * @memberof module:Tools/base/Proto
 */

/**
 * @typedef {Object} DefaultFieldsGroupsCopyable - contains predefined copyable class fields groups.
 * @memberof module:Tools/base/Proto
 */

/**
 * @typedef {Object} DefaultFieldsGroupsTight
 * @memberof module:Tools/base/Proto
 */

/**
 * @typedef {Object} DefaultFieldsGroupsInput
 * @memberof module:Tools/base/Proto
 */

/**
 * @typedef {Object} DefaultForbiddenNames - contains names of forbidden properties
 * @memberof module:Tools/base/Proto
 */

let DefaultFieldsGroups = Object.create( null );
DefaultFieldsGroups.Groups = 'Groups';
DefaultFieldsGroups.Composes = 'Composes';
DefaultFieldsGroups.Aggregates = 'Aggregates';
DefaultFieldsGroups.Associates = 'Associates';
DefaultFieldsGroups.Restricts = 'Restricts';
DefaultFieldsGroups.Medials = 'Medials';
DefaultFieldsGroups.Statics = 'Statics';
DefaultFieldsGroups.Copiers = 'Copiers';
Object.freeze( DefaultFieldsGroups );

let DefaultFieldsGroupsRelations = Object.create( null );
DefaultFieldsGroupsRelations.Composes = 'Composes';
DefaultFieldsGroupsRelations.Aggregates = 'Aggregates';
DefaultFieldsGroupsRelations.Associates = 'Associates';
DefaultFieldsGroupsRelations.Restricts = 'Restricts';
Object.freeze( DefaultFieldsGroupsRelations );

let DefaultFieldsGroupsCopyable = Object.create( null );
DefaultFieldsGroupsCopyable.Composes = 'Composes';
DefaultFieldsGroupsCopyable.Aggregates = 'Aggregates';
DefaultFieldsGroupsCopyable.Associates = 'Associates';
Object.freeze( DefaultFieldsGroupsCopyable );

let DefaultFieldsGroupsTight = Object.create( null );
DefaultFieldsGroupsTight.Composes = 'Composes';
DefaultFieldsGroupsTight.Aggregates = 'Aggregates';
Object.freeze( DefaultFieldsGroupsTight );

let DefaultFieldsGroupsInput = Object.create( null );
DefaultFieldsGroupsInput.Composes = 'Composes';
DefaultFieldsGroupsInput.Aggregates = 'Aggregates';
DefaultFieldsGroupsInput.Associates = 'Associates';
DefaultFieldsGroupsInput.Medials = 'Medials';
Object.freeze( DefaultFieldsGroupsInput );

let DefaultForbiddenNames = Object.create( null );
DefaultForbiddenNames.Static = 'Static';
DefaultForbiddenNames.Type = 'Type';
Object.freeze( DefaultForbiddenNames );

// --
// define
// --

// /**
// * Collection of routines to create a property-like entity.
// * @namespace "wTools.define"
// * @augments wTools
// * @memberof module:Tools/base/Proto
// */
//
// let Define =
// {
//   Definition,
//   field,
//   common,
//   own,
//   instanceOf,
//   makeWith,
//   contained,
//}

//

let Fields =
{

  // KnownConstructorFields,

  Combining,

  DefaultFieldsGroups,
  DefaultFieldsGroupsRelations,
  DefaultFieldsGroupsCopyable,
  DefaultFieldsGroupsTight,
  DefaultFieldsGroupsInput,

  DefaultForbiddenNames,
  CallableObject : wCallableObject,

}

//

let Routines =
{

  // // mixin
  //
  // _mixinDelcare,
  // mixinDelcare,
  // mixinApply,
  // mixinHas,
  //
  // // class
  //
  // classDeclare,
  // classExtend,
  // staticDeclare,

  constructorIsStandard,
  constructorOf,
  classGet : constructorOf,

  isSubClassOf,
  isSubPrototypeOf,

  parentOf,
  _classConstructorAndPrototypeGet,

  // prototype

  prototypeOf,

  prototypeUnitedInterface, /* experimental */

  prototypeAppend, /* experimental */
  prototypeHasPrototype, /* experimental */
  prototypeHasProperty, /* experimental */
  prototypeArchyGet, /* experimental */
  prototypeHasField,

  prototypeCrossRefer, /* experimental */
  prototypeEach, /* experimental */
  prototypeEach_deprecated,

  // instance

  instanceIsStandard,

  // property

  propertyDescriptorActiveGet,
  propertyDescriptorGet,
  propertyHide,
  propertyConstant,

  // proxy

  proxyNoUndefined,
  proxyReadOnly,
  ifDebugProxyReadOnly,
  proxyMap,

  // default

  defaultApply,
  defaultProxy,
  defaultProxyFlatteningToArray,

}

//

// _.define = Define;
_.mapExtend( _, Routines );
_.mapExtend( _, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

// // --
// // import
// // --
//
// if( typeof module !== 'undefined' )
// {
//
//   require( './Accessor.s' );
//   require( './Class.s' );
//   require( './Complex.s' );
//   require( './Define.s' );
//   require( './Like.s' );
//   require( './Workpiece.s' );
//
// }

})();
