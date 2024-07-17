// using AdminService from './admin-service';

// //aggregation annotations
// // v4
// annotate AdminService.GamesAgreggate with @(
//   Aggregation.ApplySupported: {
//     GroupableProperties: [
//         title,
//         genre,
//         typeOf,
//         price,
//         review
//     ]
//   },
//   Aggregation.CustomAggregate #price: 'Edm.Int32'
// ){
//   price @Analytics.Measure @Aggregation.default: #SUM
// }

// // v2
// annotate AdminService.GamesAgreggate with @(
//   sap.semantics: 'aggregate'
// ){
//   title @sap.aggregation.role: 'dimension';
//   typeOf @sap.aggregation.role: 'dimension';
//   review @sap.aggregation.role: 'dimension';
//   price @sap.aggregation.role: 'measure';

// };