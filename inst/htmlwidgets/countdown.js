HTMLWidgets.widget({

  name: 'countdown',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
    var cntd;

    return {

      renderValue: function(x) {

        x.opts.el = el;

        cntd = new Odometer(x.opts);

        el.innerHTML = x.value;


      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      },

      getOdometer: function(){
        return od;
      }

    };
  }
});
