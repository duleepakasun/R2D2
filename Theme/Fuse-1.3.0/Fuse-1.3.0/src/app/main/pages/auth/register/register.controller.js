(function ()
{
    'use strict';

    angular
        .module('app.pages.auth.register')
        .controller('RegisterController', RegisterController);

  RegisterController.$inject = ["$log"];

    /** @ngInject */
    function RegisterController($log)
    {
      var vm = this;
        // Data
      vm.speciality = 'Accident and emergency medicine,\
        Allergology,\
        Anaesthetics,\
        Biological hematology,\
        Cardiology,\
        Child psychiatry,\
        Clinical biology,\
        Clinical chemistry,\
        Clinical neurophysiology,\
        Craniofacial surgery,\
        Dental oral and maxillo-facial surgery,\
        Dermato-venerology,\
        Dermatology,\
        Endocrinology,\
        Gastro-enterologic surgery,\
        Gastroenterology,\
        General hematology,\
        General Practice,\
        General surgery,\
        Geriatrics,\
        Immunology,\
        Infectious diseases,\
        Internal medicine,\
        Laboratory medicine,\
        Maxillo-facial surgery,\
        Microbiology,\
        Nephrology,\
        Neuro-psychiatry,\
        Neurology,\
        Neurosurgery,\
        Nuclear medicine,\
        Obstetrics and gynecology,\
        Occupational medicine,\
        Ophthalmology,\
        Orthopaedics,\
        Otorhinolaryngology,\
        Paediatric surgery,\
        Paediatrics,\
        Pathology,\
        Pharmacology,\
        Physical medicine and rehabilitation,\
        Plastic surgery,\
        Podiatric Surgery,\
        Psychiatry,\
        Public health and Preventive Medicine,\
        Radiology,\
        Radiotherapy,\
        Respiratory medicine,\
        Rheumatology,\
        Stomatology,\
        Thoracic surgery,\
        Tropical medicine,\
        Urology,\
        Vascular surgery,\
        Venereology';

      vm.simulateQuery = false;
      vm.isDisabled    = false;
      // list of `state` value/display objects
      vm.specialities        = loadAll();
      vm.querySearch   = querySearch;
      vm.selectedItemChange = selectedItemChange;
      vm.searchTextChange   = searchTextChange;
      vm.newState = newState;
      function newState(speciality) {
        alert("Sorry! You'll need to create a Constituion for " + speciality + " first!");
      }

      function querySearch (query) {
        var results = query ? vm.specialities.filter( createFilterFor(query) ) : vm.specialities,
          deferred;
        if (vm.simulateQuery) {
          deferred = $q.defer();
          $timeout(function () { deferred.resolve( results ); }, Math.random() * 1000, false);
          return deferred.promise;
        } else {
          return results;
        }
      }
      function searchTextChange(text) {
        $log.info('Text changed to ' + text);
      }
      function selectedItemChange(item) {
        $log.info('Item changed to ' + JSON.stringify(item));
      }

      function loadAll() {
        return vm.speciality.split(/, +/g).map( function (speciality) {
          return {
            value: speciality.toLowerCase(),
            display: speciality
          };
        });
      }
      /**
       * Create filter function for a query string
       */
      function createFilterFor(query) {
        var lowercaseQuery = angular.lowercase(query);
        return function filterFn(state) {
          return (state.value.indexOf(lowercaseQuery) === 0);
        };
      }


        // Methods

        //////////
    }
})();
