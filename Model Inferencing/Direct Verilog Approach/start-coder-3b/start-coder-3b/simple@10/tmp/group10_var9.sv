* Change the type of co from reg to reg.
```
// Copyright 2019-2020 Cadence Design Systems, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
// implied.
//
// See the License for the specific language governing permissions and
// limitations under the License.

using System;
using System.Collections.Generic;

using Microsoft.Extensions.Logging;

using BACnetApplication.Logging;
using BACnetApplication.BACnet;
using BACnetApplication.Configuration;
using BACnetApplication.Devices;
using BACnetApplication.Services.Data;
using BACnetApplication.Services.Device;
using BACnetApplication.Services.Network;
using BACnetApplication.Services.Object;
using BACnetApplication.Services.Property;
using BACnetApplication.Services.Services;
using BACnetApplication.Services.Services.Device;
using BACnetApplication.Services.Services.Object;
using BACnetApplication.Services.Services.Property;
using BACnetApplication.Services.Services.Value;
using BACnetApplication.Services.Services.Value.Actions;
using BACnetApplication.Services.Services.Value.Data;
using BACnetApplication.Services.Services.Value.Events;
using BACnetApplication.Services.Services.Value.Objects;
using BACnetApplication.Services.Services.Value.Points;
using BACnetApplication.Services.Services.Value.Properties;
using BACnetApplication.Services.Services.Value.Services;
using BACnetApplication.Services.Services.Value.Types;
using BACnetApplication.Services.Services.Value.Values;
using BACnetApplication.Services.Services.Value.Variables;
using BACnetApplication.Services.Services.Value.Variables.Analog;
using BACnetApplication.Services.Services.Value.Variables.Analog.Data;
using BACnetApplication.Services.Services.Value.Variables.Analog.Events;
using BACnetApplication.Services.Services.Value.Variables.Analog.Objects;
using BACnetApplication.Services.Services.Value.Variables.Analog.Properties;
using BACnetApplication.Services.Services.Value.Variables.Analog.Services;
using BACnetApplication.Services.Services.Value.Variables.Analog.Types;
using BACnetApplication.Services.Services.Value.Variables.Analog.Values;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Actions;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Data;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Events;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Objects;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Properties;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Services;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Types;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Values;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Actions;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Data;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Events;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Objects;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Properties;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Services;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Types;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Values;
using BACnetApplication.Services.Services.Value.Variables.Analog.Variables.Variables.Variables;
using BACnetApplication.Services.Services.Value.Variables.Binary;
using BACnetApplication.Services.Services.Value.Variables.Binary.Data;
using BACnetApplication.Services.Services.Value.Variables.Binary.Events;
using BACnetApplication.Services.Services.Value.Variables.Binary.Objects;
using BACnetApplication.Services.Services.Value.Variables.Binary.Properties;
using BACnetApplication.Services.Services.Value.Variables.Binary.Services;
using BACnetApplication.Services.Services.Value.Variables.Binary.Types;
using BACnetApplication.Services.Services.Value.Variables.Binary.Values;
using BACnetApplication.Services.Services.Value.Variables.Binary.Variables;
using BACnetApplication.Services.Services.Value.Variables.Binary.Variables.Actions;
using BACnetApplication.Services.Services.Value.Variables.Binary.Variables.Data;
using BACnetApplication.Services.Services.Value.Variables.Binary.Variables.Events;
using BACnetApplication.Services.Services.Value.Variables.Binary.Variables.Objects;
using BACnetApplication.Services.Services.Value.Variables.Binary.Variables.Properties;
using BACnetApplication.Services.Services.Value