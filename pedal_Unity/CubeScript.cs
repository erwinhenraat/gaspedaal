using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CubeScript : MonoBehaviour {

    [SerializeField]
    private ArduinoInput ai;

    void Update(){
        this.transform.localScale = new Vector3(1, 0.5f + ai.arduinoPedalValues.a / 500.0f, 1);
    }
}
