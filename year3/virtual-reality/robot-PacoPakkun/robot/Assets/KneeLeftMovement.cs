using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KneeLeftMovement : MonoBehaviour
{
    private float v = 10f;
    private float min = 0f;
    private float max = 30f;
    private float x = 30f;

    void Start()
    {
    }

    void Update()
    {
        var dt = Time.deltaTime;
        var x1 = x + v * dt;
        if (x1 > max || x1 < min)
        {
            v *= -1;
        }

        x += v * dt;

        transform.localRotation = Quaternion.AngleAxis(x, Vector3.back);
    }
}