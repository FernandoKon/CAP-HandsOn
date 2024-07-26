using { AdminService.Games, AdminService.Companies } from './admin-service';

annotate Games with @(
    restrict :[
        {
            grant: ['CREATE','DELETE','READ','UPDATE'],
            to: 'admin'
        },
        {
            grant: ['READ'],
            to: 'test'
        }
    ]
);

annotate Games with @(requires: 'admin');
